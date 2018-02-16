Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,1/1] usb: cdc_acm: prevent race at write to acm while system resumes
From: sathyanarayanan.kuppuswamy@linux.intel.com
Message-Id: <4d036ab4-1239-8afb-4eff-b4884006c326@linux.intel.com>
Date: Thu, 15 Feb 2018 16:03:04 -0800
To: Greg KH <gregkh@linuxfoundation.org>, sathyanarayanan.kuppuswamy@linux.intel.com
Cc: oneukum@suse.com, felipe.balbi@intel.com, heikki.krogerus@intel.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Dominik Bozek <dominikx.bozek@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>
List-ID: <linux-usb.vger.kernel.org>

SGkgR3JlZywKCgpPbiAwMi8xNS8yMDE4IDA5OjM3IEFNLCBHcmVnIEtIIHdyb3RlOgo+IFdoeSBo
YXNuJ3QgdGhlIGF1dGhvciBvZiB0aGlzIHBhdGNoIHNpZ25lZCBvZmYgb24gaXQ/ClRoaXMgcGF0
Y2ggaGFzIGJlZW4gaW5pdGlhbGx5IHN1Ym1pdHRlZCB3aXRoIEdlcnJpdC1JRCBhbmQgc29tZSBj
dXN0b20gCnRhZ3MuIER1cmluZyB0aGUgc2NydWJiaW5nIHByb2Nlc3Mgb2YgdGhpcyB1bnJlbGF0
ZWQgZGV0YWlscywgSSB0aGluayAKdGhlIGF1dG9tYXRlZCBzY3JpcHQgYWNjaWRlbnRhbGx5IGRl
bGV0ZWQgdGhlIHNpZ25lZC1vZmYgdGFnLiBMZXQgbWUgCmNvbmZpcm0gaXQgd2l0aCBhdXRob3Ig
YW5kIGdldCBiYWNrIHRvIHlvdS4gTW9zdGx5IEkgd2lsbCBzdWJtaXQgYSB2MiAKd2l0aCBwcm9w
ZXIgc2lnbi1vZmYgaW5mby4K
