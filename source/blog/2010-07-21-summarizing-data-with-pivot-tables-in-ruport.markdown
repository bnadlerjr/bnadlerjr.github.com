---
title: "Summarizing Data with Pivot Tables in Ruport"
date: 2010-07-21 13:45
---
<p>Pivot tables are a useful data tool. They allow you to transform large amounts of tabular data into an easier to read format. They can be difficult to create, however, and some people have a hard time understanding how to create them. It took me awhile to fully grasp how they worked.</p>
<p>Pivot tables are mostly found in spreadsheet software, but there are other tools, too. One such tool is Ruport, a Ruby based reporting tool.</p>
<h2>What is a Pivot Table</h2>
<p>A pivot table is</p>
<blockquote>a data summarization tool found in data visualization programs such as spreadsheets... pivot-table tools can automatically sort, count, and total the data stored in one table or spreadsheet and create a second table displaying the summarized data.<cite><a href="http://en.wikipedia.org/wiki/Pivot_table">Wikipedia</a></cite></blockquote>
<p>&nbsp;</p>
<p>Let's say you have a table of sales data like the one below. The first column shows the regions in which sales occurred. The second shows the date of the sale. Finally, the third shows how many units were sold.</p>
<p>Now imagine that there were over 1000 lines of data like this, but only occurring in four regions and over the time span of one month. Not only would it be difficult to read, but we cannot tell how many units were sold in a certain region on a certain day without re-sorting and filtering the data... unless we use a pivot table.</p>
<p>A pivot table has three main parts: a column to group by, a column to "pivot" and a column to summarize.</p>
<ol>
<li>The group column usually consists of repeated data values that you want to, well, <em>group</em>. These values will become the row headings on the <em>left-hand side</em> of the new table.</li>
<li>The pivot column values become the row headings at the <em>top</em> of the new table, these values are also grouped (this is the part that sometimes confuses people).</li>
<li>Finally the summary column is aggregated by summing, counting, averaging, etc. The aggregations supported vary by software vendor, but all include the ones I just mentioned.</li>
</ol>
<img src="images/example-pivot-table.png" alt="Example Pivot Table" />
<h2>Ruport#pivot</h2>
<h3>Creating the Table</h3>
<p><a href="https://github.com/ruport/ruport">Ruport</a> is an awesome Ruby library for generating reports using table based data. It also has some basic pivot table support.</p>
<p>Take a look at the irb session below. It uses the same example as above to create a Ruport::Data::Table.</p>
<pre><code>
    &gt;&gt; require 'ruport'
    &gt;&gt; t = Ruport::Data::Table.new :data =&gt; [
    ?&gt; ['North', '1/1/2010', 5],
    ?&gt; ['South', '1/1/2010', 2],
    ?&gt; ['East', '1/1/2010', 4],
    ?&gt; ['West', '1/1/2010', 1],
    ?&gt; ['North', '1/15/2010', 10],
    ?&gt; ['West', '1/15/2010', 9]],
    ?&gt; :column_names =&gt; %w[Region Date Quantity]
    &gt;&gt;
    &gt;&gt; puts t
    +-------------------------------+
    | Region |   Date    | Quantity |
    +-------------------------------+
    | North  | 1/1/2010  |        5 |
    | South  | 1/1/2010  |        2 |
    | East   | 1/1/2010  |        4 |
    | West   | 1/1/2010  |        1 |
    | North  | 1/15/2010 |       10 |
    | West   | 1/15/2010 |        9 |
    +-------------------------------+
</code></pre>
<h3>Performing the Pivot</h3>
<p>Now, we want to pivot the table on the "Date" column, group by the "Region" column and summarize the values in the "Quantity" column. We do this using the pivot instance method on the Table object.</p>
<p>Now our data is easier to read and is ready to be rendered using any Ruport formatter you'd like.</p>
<pre><code>
    &gt;&gt; puts t.pivot 'Date', :group_by =&gt; 'Region',
    ?&gt; :values =&gt; 'Quantity'
    +-------------------------------+
    | Region | 1/15/2010 | 1/1/2010 |
    +-------------------------------+
    | North  |        10 |        5 |
    | South  |           |        2 |
    | East   |           |        4 |
    | West   |         9 |        1 |
    +-------------------------------+
</code></pre>
<h3>One Caveat</h3>
<p>Right now, the Ruport pivot method does not work <em>exactly</em> like this. Instead of summing the value column it only takes the first value encountered. It doesn't apply in this example since there is only one data point for each "pivot", but it will be a problem with larger datasets. I've written a <a href="http://github.com/bnadlerjr/ruport/commit/9fd92cd785e95bb8f04d182a34840467dd7aea96">patch</a> that corrects this, but it hasn't been applied to the official repo. So for now, you can get the patch from <a href="http://github.com/bnadlerjr/ruport">my fork</a>. I'll update this post once the patch has been accepted.</p>
<p><strong>Update:</strong> The Ruport patch I mention above has been accepted into Ruport core. The patch also includes support for other operations. See <a href="http://github.com/ruport/ruport/commit/333a43e3f8ab1e10c36edbb8ea540fb65bacad5b">my commit</a> for details.</p>
