Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: xhci: Drop superfluous initialization in xhci_queue_ctrl_tx()
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Message-Id: <CAHQ1cqHia75RWT25T2+QnZdd-wVkdyn0QciVo3b1w=BLN35D2g@mail.gmail.com>
Date: Thu, 7 Feb 2019 13:07:46 -0800
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBGZWIgNywgMjAxOSBhdCA4OjQ0IEFNIFNlcmdlaSBTaHR5bHlvdgo8c2VyZ2VpLnNo
dHlseW92QGNvZ2VudGVtYmVkZGVkLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyEKPgo+IE9uIDA3LjAy
LjIwMTkgMzowMywgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4KPiA+IFNpbXBsaWZ5IGZpbGVkJ3Mg
aW5pdGlhbGl6YXRpb24gYnkgZGlyZWN0bHkgYXNzaWduaW5nIGl0cyBmaW5hbCB2YWx1ZQo+Cj4g
ICAgIGZpZWxkJ3MuCj4KCk9vcHMsIG1pc3NlZCB0aGF0LiBXaWxsIGZpeCBpbiB2Mi4KClRoYW5r
cywKQW5kcmV5IFNtaXJub3YK
