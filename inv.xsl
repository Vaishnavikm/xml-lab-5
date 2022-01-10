<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h1 style="text-align:left">Inventory details</h1>
                <h2>Products:</h2>
                <table border = "1">
                    <tr>
                        <th style="text-align:left">Product_ID</th>
                        <th style="text-align:left">Name</th>
                        <th style="text-align:left">Quantity</th>
                        <th style="text-align:left">Price</th>
                        <th style="text-align:left">mft_date</th>
                    </tr>
                    <xsl:for-each select="inventory/Products">
                        <xsl:sort select="product_id" />
                        <xsl:if test="price > 500">
                            <tr>
                                <td>
                                    <xsl:value-of select="product_id" />
                                </td>
                                <td>
                                    <xsl:value-of select="Name" />
                                </td>
                                <td>
                                    <xsl:value-of select="Quantity" />
                                </td>
                                <td>
                                    <xsl:value-of select="price" />
                                </td>
                                <td>
                                    <xsl:value-of select="mft_date" />
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
                <h2>Stocks:</h2>
                <table border = "1">
                    <tr>
                        <th style="text-align:left">Stock_ID</th>
                        <th style="text-align:left">Name</th>
                        <th style="text-align:left">Quantity</th>
                        <th style="text-align:left">location</th>
                        <th style="text-align:left">Stock_type</th>
                    </tr>
                    <xsl:for-each select="inventory/Stocks">
                        <xsl:sort select="Quantity" />
                        <xsl:choose>
                            <xsl:when test="Quantity > 10">
                                <tr>

                                    <td>
                                        <xsl:value-of select="stock_id" />
                                    </td>

                                    <td>
                                        <xsl:value-of select="Name" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Quantity" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="location" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Stock_type" />
                                    </td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>

                                    <td>
                                        <xsl:value-of select="stock_id" />
                                    </td>

                                    <td>
                                        <xsl:value-of select="Name" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Quantity" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="location" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Stock_type" />
                                    </td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
                <h2>Orders:</h2>
                <table border = "1" >
                    <tr>
                        <th style="text-align:left">order_id</th>
                        <th style="text-align:left">Branch_details</th>
                        <th style="text-align:left">O_date</th>
                        <th style="text-align:left">Product</th>
                        <th style="text-align:left">Price</th>
                    </tr>
                    <xsl:for-each select="inventory/Orders">
                        <tr>
                            <td>
                                <xsl:value-of select="order_id" />
                            </td>
                            <td>
                                <xsl:value-of select="Branch_det" />
                            </td>
                            <td>
                                <xsl:value-of select="O_date" />
                            </td>
                            <td>
                                <xsl:value-of select="product" />
                            </td>
                            <td>
                                <xsl:value-of select="Price" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>