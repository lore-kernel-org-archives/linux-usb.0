Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb-core: Fix potential null pointer dereference in xhci-debugfs.c
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Message-Id: <00b29024-9bdc-db97-9978-4483066d526a@linux.intel.com>
Date: Mon, 11 Dec 2017 12:39:14 +0200
To: Alexander Kappner <agk@godking.net>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Lu Baolu <baolu.lu@linux.intel.com>
List-ID: <linux-usb.vger.kernel.org>

T24gMTAuMTIuMjAxNyAwMDozOCwgQWxleGFuZGVyIEthcHBuZXIgd3JvdGU6Cj4gSGkgTWF0aGlh
cywKPiAKPiB0aGFua3MgZm9yIHRoZSBwYXRjaCEgVGhlIHN5c3RlbSBub3cgcmVzdW1lcyBjbGVh
bmx5IGZyb20gaGliZXJuYXRlIGV2ZW4gd2l0aCB1c2JtdXhkIGRvaW5nIGl0cyB0aGluZy4KPiAK
PiBUZXN0ZWQtYnk6IEFsZXhhbmRlciBLYXBwbmVyIDxhZ2tAZ29ka2luZy5uZXQ+Cj4gCj4gV2hp
bGUgdGVzdGluZyB0aGlzIEkgaGl0IHNvbWUgb3RoZXIgaXNzdWVzIHdpdGggeGhjaS1kZWJ1Z2Zz
LmMgYnV0IEknbGwgd3JpdGUgdGhlc2UgdXAgaW4gYSBzZXBhcmF0ZSBidWcuCj4gCgpUaGFua3Ms
CkFkZGluZyByZXBvcnRlZC1ieSBhbmQgdGVzdGVkLWJ5IHRhZ3MsIGFuZCBwdXNoaW5nIHBhdGNo
IHRvIG15IGZvci11c2ItbGludXMgYnJhbmNoCgotTWF0aGlhcwotLS0KVG8gdW5zdWJzY3JpYmUg
ZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXVzYiIgaW4K
dGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBt
YWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5o
dG1sCg==
