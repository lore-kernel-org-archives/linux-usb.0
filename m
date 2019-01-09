Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,2/6] clk: qcom: Skip halt checks on gcc_usb3_phy_pipe_clk for 8998
From: Stephen Boyd <sboyd@kernel.org>
Message-Id: <154706034090.15366.11081837995313995010@swboyd.mtv.corp.google.com>
Date: Wed, 09 Jan 2019 10:59:00 -0800
To: Jeffrey Hugo <jhugo@codeaurora.org>, mturquette@baylibre.com
Cc: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, balbi@kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

UXVvdGluZyBKZWZmcmV5IEh1Z28gKDIwMTktMDEtMDQgMDg6NTA6MTUpCj4gVGhlIGdjY191c2Iz
X3BoeV9waXBlX2NsayBpcyBnZW5lcmF0ZWQgYnkgdGhlIHBoeSwgYnV0IGlzIGFsc28gdXNlZCBi
eQo+IHRoZSBwaHkgZHVyaW5nIGluaXQuICBUaGUgY2xvY2sgbmVlZHMgdG8gYmUgZW5hYmxlZCBk
dXJpbmcgdGhlIGluaXQKPiBzZXF1ZW5jZSwgYnV0IG1heSBub3QgYmUgZnVsbHkgYWN0aXZlIHVu
dGlsIGFmdGVyIHRoZSBpbml0IHNlcXVlbmNlIGlzCj4gY29tcGxldGUuICBUaGlzIGNhdXNlcyBh
IGNhdGNoLTIyIGlmIHRoZSBjbG9jayBzdGF0dXMgaXMgY2hlY2tlZCBkdXJpbmcKPiBlbmFibGUu
ICBBcyBhIHJlc3VsdCwgc2tpcCB0aGUgY2hlY2tzIHRvIGF2b2lkIHRoZSB0cm91Ymxpbmcgc2l0
dWF0aW9uLgoKSSB3aWxsIGFzayBhZ2FpbiwgaXMgYW55b25lIGdvaW5nIHRvIGZpeCB0aGlzIGlu
IHRoZSBwaHkgZHJpdmVyPyBJbgp0aGVvcnkgaXQgaXNuJ3QgbmVlZGVkIGlmIHRoZSBwaHkgZHJp
dmVyIGNhbiBkbyB0aGluZ3MgZGlmZmVyZW50bHksIGJ1dApsYXN0IHRpbWUgSSBjaGVja2VkIEkg
d2FzIHRvbGQgdGhhdCB0aGUgcGh5IHRlYW0gc2FpZCBpdCBoYWQgdG8gYmUgZG9uZQp0aGlzIHdh
eS4K
