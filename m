Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DF83A168C;
	Fri, 31 Jul 2026 10:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492228; cv=none; b=sL6ukLMDHSanfrbA61TX+8ZogkHIf/piPYdPj73Iqa0N28MAs2kmW17oZ7nYSQBe6sXK5mcgjHZe7tnL87TrgZdoVr51ynif02lkJIQKEC9thAb1zxiE9+QJCLMFutBU2VT5+lend9/ph14lu6NxK40+YoXN6Fb0hr3wGSu6EA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492228; c=relaxed/simple;
	bh=EWdTSjaA6TeDx8EUrIO5WzhW6oRvsC51ifMVxZE1FGQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Bm9BfdYZkbT5hsY8MZQTZwWIPwGjl9lqRbvimTYoTPcGbVLmA/WWiIl4OVCNeWGDWVbnmLkVKdmVF9EV/YL53SjC1WIgjEKhd/PH2vifOOR47QKfhwSkBaeylCYeCWKVmMNCJyAatWpyV9gfE0O80YU0iWQXBSIYYy3T8MROL+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=GT5fh+wx; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="GT5fh+wx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=7/+1IGaKQRtO+n7xTwV1/wWmqGvU5KKduLk8AHgug+E=;
  b=GT5fh+wx2W6jgtHpyvb2cnlNqomLLnYYve+vi+8ZdPNeqNlfBJRPvp+w
   1FR/eEAdmvyHdIFsq7FoDiY7ynzSWUc149kA0tWq6JWEisIoElkfG5jki
   l3+VooFNPbNV/bJjra4TwcbhMYLQ5U7z1GTXOlnYEM5w13ZJROpYW1ILy
   KYV+60gIX0dRyuzQC/vcys9Gr/b1368obhpKl4f9LRxXaN99RXfRuph1S
   yTFmne59UEV1PpycWFq1LrYIYH5ALpuwuuNZ3dBM/pLb+c/qdhEGJih33
   0OpZ7RUpQ4f5oiNCb4RDQciJixpw4olFuud9mAdEmElBkLatkxkuXrEl8
   w==;
X-CSE-ConnectionGUID: RkC+QCAjStWm1ecadC39Wg==
X-CSE-MsgGUID: ztF56PXPSoOsasYTJCCuiQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 31 Jul 2026 18:01:53 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 66VA1lIm005693;
	Fri, 31 Jul 2026 18:01:47 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 18:01:44 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Subject: [PATCH v6 0/2] usb: typec: ucsi: Add ITE IT8851/IT8853 support
Date: Fri, 31 Jul 2026 18:02:02 +0800
Message-ID: <20260731-ucsi-itepd-v6-0-d25ae12b181f@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NzQ6CMBAGX4X0bEnpDwVPvofxUNpFaqKQtlQN4
 d1t8SKJx9l8M7sgD86CR8diQQ6i9XZ8JKgPBdKDelwBW5MYUUJrIiuJZ+0ttgEmgzm0nEHFGto
 TlITJQW9fW+x8+bKfuxvokAt5MVgfRvfevkWed3/DkWOCe9YpoYwxxPSndC/1eC/DE+VyFD8u5
 TtXJNdUqmEgdKul3Lnrun4ACzGKjvMAAAA=
X-Change-ID: 20260717-ucsi-itepd-4e943e1382f0
To: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Amber Kao <amber.kao@ite.com.tw>,
        Bling
 Chiang <Bling.Chiang@ite.com.tw>, Eric Su <Eric.Su@ite.com.tw>,
        Doreen Lin
	<doreen.lin@ite.com.tw>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 HSCMAIL1.internal.ite.com.tw (192.168.35.58)
X-TM-SNTS-SMTP:
	07C7749C0D401F12153651525F4B0AEAB3F1B0215B0DD08EA61ED5EE59BE43D72002:8
X-MAIL:mse.ite.com.tw 66VA1lIm005693

This series adds Device Tree bindings and minimal UCSI driver support 
for the ITE IT8851/IT8853 USB Type-C Power Delivery controller over I2C.

Changes in v6:
- Drop the redundant "ite,it8853" entry from the driver OF match table;
  it8853 falls back to ite,it8851 in the binding (Krzysztof)

Link to v5: https://patch.msgid.link/20260724-ucsi-itepd-v5-0-d1a83e5c9c77@ite.com.tw
Link to v4: https://lore.kernel.org/all/20260717-ucsi-itepd-v4-0-f3ba5addd0df@ite.com.tw/
Link to v3: https://lore.kernel.org/all/20260710-ucsi-itepd-feature-v3-0-8523e1e1c47a@ite.com.tw/
Link to v2: https://lore.kernel.org/all/20260710-ucsi-itepd-feature-v2-0-41943fd5df38@ite.com.tw/
Link to v1: https://lore.kernel.org/all/20260615-ucsi-itepd-feature-v1-0-a826cfd0df6a@ite.com.tw/

Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
---
Amber Kao (2):
      dt-bindings: usb: Add ITE IT8851/IT8853 Type-C PD controllers
      usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD controller driver

 .../devicetree/bindings/usb/ite,it8851.yaml        | 151 +++++++++
 MAINTAINERS                                        |   9 +
 drivers/usb/typec/ucsi/Kconfig                     |  10 +
 drivers/usb/typec/ucsi/Makefile                    |   1 +
 drivers/usb/typec/ucsi/ucsi_itepd.c                | 364 +++++++++++++++++++++
 5 files changed, 535 insertions(+)
---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260717-ucsi-itepd-4e943e1382f0

Best regards,
--  
Amber Kao <amber.kao@ite.com.tw>

