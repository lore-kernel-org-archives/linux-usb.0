Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,3/6] usb: host: Stops USB controller init if PLL fails to lock
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20190122080414.GA9680@kroah.com>
Date: Tue, 22 Jan 2019 09:04:14 +0100
To: Yinbo Zhu <yinbo.zhu@nxp.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Xiaobo Xie <xiaobo.xie@nxp.com>, Jerry Huang <jerry.huang@nxp.com>, Ran Wang <ran.wang_1@nxp.com>, Ramneek Mehresh <ramneek.mehresh@freescale.com>, Nikhil Badola <nikhil.badola@freescale.com>, Suresh Gupta <suresh.gupta@freescale.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMTA6MjU6MTBBTSArMDAwMCwgWWluYm8gWmh1IHdyb3Rl
Ogo+IEZyb206IHlpbmJvLnpodSA8eWluYm8uemh1QG54cC5jb20+CgpUaGlzIGxpbmUgaXMgc3Rp
bGwgd3JvbmcgOigK
