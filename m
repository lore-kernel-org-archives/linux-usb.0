Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACF1424D41;
	Wed, 15 Jul 2026 12:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118569; cv=none; b=Kxc7TP/UuEYvxWVK0MuuMX1PA1CPvZCqifm9XMEI50M/JIO34xSN0EJoa2Vhp0orRgrjJuBVU4FzJYLXWmKFK38huMvznCDbXlKLjcAPRMe8V73Xjy6bFPuz2VKhWGKdCGAnoFowTxgT3EDkPuLsnxSSS4KIzWAN8Jo1r47czh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118569; c=relaxed/simple;
	bh=+phK5cBo1ThZ7W1wdEsG/jLsuf7d+QSwzFHNAMq5ygg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LDPY9sbusVPoFfqnnQIq4bxBvj8d9F/XZDCtU+maTv1Q5Cuj6pzOB7FbIj5kfoOEkf/0hI+57Kma/++0rvScOc0aLT1hOaOPT4wVRwnnBSaIw4aaJJDvUfvnvNKr/gQdNMIeDk+54MOHUwekej3eKkNOFJU620nFOGrLuAmPUnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIsYWaDc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIsYWaDc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E4E1F000E9;
	Wed, 15 Jul 2026 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784118566;
	bh=OX/E+znu9utCqYUph0nqtql1+Z5Fa6iFr7rbQEV+jiQ=;
	h=From:Subject:Date:To:Cc;
	b=jIsYWaDcuH9i/lIAl8tPzBkAk1kAU5Svye5+TRM3DV3U/tudqgRSnePs0Re69Z/U9
	 vH/wjYm9Uqvm9NcLOnwyrmRaOdmLmvh2vNeaXyMCD3wWVy42RAsLh8alWjzg8P3sSo
	 DUB3283Qf2lQ6sRUh2ajEEtTyXAsAFhTpZCStKDOwGeqzkxeHes2+asSPhTc5ux52O
	 jwAlhSQEBWHjTERzWcl3+WOKql4nmBnsU2VOkzg8BSHNa2K8r4yoleLFA+74CEao4Q
	 B/5EzxrmEW1MVvikWYGo7So051ODgOeVr7oKVo+T/f2ppy5FG3ppMR2xhG4OZXZ10i
	 UJsWOudi54DwA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/4] DWC3 link tunneling state reporting
Date: Wed, 15 Jul 2026 14:29:16 +0200
Message-Id: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NywqDMBBFf0WybiQ+ItJV/6OIxHGqKZrYTLQt4
 r83Wrrt5sKByzkrI3QaiZ2jlTlcNGlrAqSniEGvTIdct4FZKtJCSJFzbycNvH1CVvvZGBy06Wr
 yyiOXQpYlCEwUZiwIJoc3/Trk1+rLNDd3BL8b90evyVv3PupLsv9+IfkvtCRc8FwpVUAGSQ7Nx
 RLFj1kNYMcxDsOqbds+eVOABN0AAAA=
X-Change-ID: 20260504-topic-dwc3_tunneling_state-50588c0e1ae3
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784118563; l=2672;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=+phK5cBo1ThZ7W1wdEsG/jLsuf7d+QSwzFHNAMq5ygg=;
 b=uqYgpqfSWr0DiwXcZhz02A12eCpSKYkgH3P7k1eJ593Dmdsq8MPPtrLYY/bcqypaOTVepB8L2
 HzDbGOafUlGAcBbnSiaj4XEAr7/WXyNfmRMvToS6rYvXgnfBsVJa+Z0
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Currently, retrieving the tunneled/native state of a running port is
only possible on Intel XHCI hosts. This series extends that to CIO-
capable DWC31 controllers (see [1]).

Note that this patchset only results in the correct udev->tunnel_mode
value being assigned. Creating the device links (which requires this
information) between the USB4 router and the USB3 controller does not
currently take place on DT-based platforms, but that will be amended
in a follow-up patchset.

Tested on a Qualcomm X1E80100 CRD board, with a (currently) out-of-tree
set of drivers.

[1] I'm not entirely sure about the DWC version range (particularly
    wrt DWC32 and newer), so I limited it to a reasonable subset. I'll
    happily amend that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Add handling for XHCI v1.2's USB3 tunneling and PORTSC.TM for
  platforms that advertise it (!!! UNTESTED !!!, I have no access to
  HW that exposes this)
- Prefer the aforementioned cap over custom implementations
- Bail out of the DWC3-specific check if `usb4-host-interface` device
  property is absent - hence this now depends on:
  https://github.com/devicetree-org/dt-schema/pull/196

- Link to v1: https://patch.msgid.link/20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com

To: Mathias Nyman <mathias.nyman@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Konrad Dybcio (4):
      usb: xhci: debugfs: Expose the USB3 tunneling ext_cap register value
      usb: xhci: Honor PORTSC.TM if valid
      usb: xhci: Allow custom op for usb_link_tunnel_mode reporting
      usb: dwc3: Notify XHCI core of tunneled status

 drivers/usb/dwc3/core.c          | 16 ++++++++++++++++
 drivers/usb/dwc3/core.h          | 18 ++++++++++++++++++
 drivers/usb/dwc3/host.c          | 12 ++++++++++++
 drivers/usb/host/xhci-debugfs.c  |  9 +++++++++
 drivers/usb/host/xhci-debugfs.h  |  2 ++
 drivers/usb/host/xhci-ext-caps.h |  4 ++++
 drivers/usb/host/xhci-hub.c      | 32 +++++++++++++++++++++++++-------
 drivers/usb/host/xhci-plat.c     |  2 ++
 drivers/usb/host/xhci-plat.h     |  1 +
 drivers/usb/host/xhci-port.h     |  3 ++-
 drivers/usb/host/xhci.c          |  3 ++-
 drivers/usb/host/xhci.h          |  5 ++++-
 12 files changed, 97 insertions(+), 10 deletions(-)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260504-topic-dwc3_tunneling_state-50588c0e1ae3

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

