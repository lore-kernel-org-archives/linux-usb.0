Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713860;
	b=AkJyEl8RPrbhtX6NrcUKCFZ6j+PNAx6l5qCzVA4LnVeOH9lWvZe7UgU1BIJcM11yLiWu
	 ct/Hkz7tJzH9Yo3nfaOvBs5kfQ9HrXFbwrrqwzANjtsdEtVp1uLjsh6nQJcE1ua/fKOaS
	 dRnPnzMk22fHXqvLupCowEszuSojO0xauOlgiPgOuL48FP1uxLnW4eUw7s6GTBek0fxZ5
	 jDbck0lNbobsaqDaCTP2uRagsSYi6pWue2KK9bA13M0ffI8ehZmijrv9obx2DfOCjv+yS
	 ByY3J0ehkEddGlQzAkuhVyhGIO5SGWLFcYtlDM3UFtiC0zjSPbcx5k04mWHOOCuP/Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qFxzkDzUeponfrpyo6AmtrMRz1h2zoLm4IYo0r4huAs=;
	b=IdTH6Fcg+dy65EVWCDQ3+L3XGGXFEEtSZfuvak17QAuk0/6y7Rztu370+TgvemZi/0ME
	 jSV+mC4980szNtFf9z4hE3urdQYta4JP0FvCxyIun2AWXItgp+H52lctwpu+2xnr/r6gj
	 vsNGKX1347OvEd2BFUJyOvxbYPtqKbCn17fuYNdvsDpqMxutgSlF9aprVSV0XyTHEZaVZ
	 H/VGvJDQ0+robabqvsTvZs8Cl4XWkJ7arATKLs9xhjWSIr//SeWMyjyhRdIR5aykvQgZV
	 UEQ6eaxXsiw5eLLLrMIzaVYVSPzb3Zs0ase9Daozkxz0elPi/NEEQJlsRUP0nIwAxhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VGTkq/6H";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921D3606EEB2
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 13:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 921D3606EEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGTkq/6H
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so5269927c88.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 05:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713860; x=1794318660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFxzkDzUeponfrpyo6AmtrMRz1h2zoLm4IYo0r4huAs=;
        b=VGTkq/6HkjrzUnmL6Mrm0vavE9V81mqMM3gsqiYoxMFGaSbHpf0BtsFvF9E3KYOjG/
         NtHLXC9tsOh0h/IhvUqUSparomzHYX+4Pyk3/apTGCRE1KJuVWCn8nTOU9BncaJ9J8wC
         Ig+QNcD+cW3wxGaQ/bQwXK518KDMA2xzVLNRvM8Cf0LfySBjah27eCOuFJcne9HuN0yw
         105OTS/dc2YZYA1CF/mIynvEwmKkvzc3jsJFgbIw1r6JSYClha9wTL31COJFKokuwg32
         zRaGlWTvf/x3/xUIrdv87DplV132uCkt72AFpCeLAPSwLIjxk2NJ+NQ8JUkgBo8cAhat
         sRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713860; x=1794318660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFxzkDzUeponfrpyo6AmtrMRz1h2zoLm4IYo0r4huAs=;
        b=e+Ml5a2y9gyWqgkR1K6ZdWfuYpNljREb9Sjt8sstXIPd0PehIirbnt9DaoZaNiF7HS
         x6JX1ytZVgm2aUhO9j4haDsjzZWfayIiF/DIhZeCaBEEETM/jh1Tzh4ZoRAl9SGsv5gH
         Vl+agh2gSWW7rHR1PP1AnrZZmkWaF6DeTPNr6t/sekJQ8HTzxl1Cl6AoOvVKaqAbSNbM
         fUFoOU5rtg5PsO7df8eMx/XhA/DHc1A/8w/xsFFl7258mh8HWUJjWTRrucG5FYuQ+6hi
         PlXRfnB4LVBLMTZ78o1zmVtgDPCVcGMPmsufM57BqhZ0QmkuIx3CVgNY4ePtLelQAhdG
         XRyQ==
X-Forwarded-Encrypted: i=1; AKwUvByzUQn9S/nQERZyLqJUULNrQ6x1+3nVGFYVvE+k6ehWETE2j/bzQo+q8Qhq91rZxlBs2sMFTjMnYDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/diSxWsDxoL9Q462dhyoIsItOTlSsLZ2gKBdyeMxB8gFwXugQY
	pq3lfMZIbfCS8u3SxVTmAeIhQC+lHtbGINl429ZvUMpZKsBagm+zHxd5
X-Gm-Gg: AYBFou1U9eCCXvHdoeWDBFP7ig50lo9zp0shUsKp9ML5zWrHumLyIc1Kg8058AUwMwX
	8RL+ENeaXOn2xlgHPDfRRPHtpZXTk3N5tgy99uAioLksyO6OkyaiJIM48x+2uJSIrKCbrh7vdpD
	/Iapqm1U/9JBiBaTp9bA/Rbutlj4b82CoAi3slWmBtZmxHKL2sHvd1ggGRVUx/pHaY/AxzPeVnp
	WBi+lSENR+quEGqrXRgNe5FyvOe6zqoIp2pVU7FF+wL2Vznv9nkGGw43NFjg/WsF86hVk055t+4
	bMfi9T0b76QS2AJ/QzR4aYycAUvX0xEZSKdamNOgzyUzaWlW/VPIRA69w+VDYrNe433moNDjQhO
	CqxGBJVBFeoT6+9TgdcQGhP4XOeOMWUqONCpxDKv9Zo0ICYxZVzkyJ0qMx3pkna+/Ee7DvL86Oo
	DaxQkFQN4jSN8aFO25aANFufyVrKyqkRv2T+MNoTdeBNvaQeeh5k9ztGADr6TExjczpVT71lkgL
	8Gbxv6u1Eki2MJGPEgFbVSfYO0MuBqrCvXLBT9hVgYJm/RjFaw9Glzlx3cAmx9UuqpeoYRS+23X
	eBec0M5rHkTQzJ3mLlQKiN74AAIa7o1oHPTD6gDLC2T0
X-Received: by 2002:a05:701b:4515:20b0:166:5552:780a with SMTP id a92af1059eb24-1ac5b028b11mr19358391c88.8.1793713859405;
        Tue, 03 Nov 2026 05:50:59 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm42837321c88.5.2026.11.03.05.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:50:58 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Tue,  3 Nov 2026 22:50:54 +0900
Message-ID: <20261103135057.1682-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With a USB-C monitor in DisplayPort pin assignment C or E, the QMP
USB3-DP combo PHY gives all four lanes to DisplayPort and keeps its USB
PCS powered down. The USB 2.0 pair still works. Such monitors often
have a USB 2.0 hub. But the dwc3 controller still depends on the USB3
PIPE clock. On Kaanapali the next xHCI reset in this state times out
("Host halt failed, -110"). USB stays lost until the cable is replugged.
Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk on/off to
common") keeps the pipe clock branch enabled. That is not enough here.

This series lets the controller be a Type-C mode switch next to the PHY
and moves it to the UTMI clock, the way "qcom,select-utmi-as-pipe-clk"
does statically, before the PHY switches to DP-only mode.

On Kaanapali the PHY becomes a mode switch with Balaji Kalkonda's
DisplayPort series [1]; patch 3 is the controller side for the same
SoC. Other SoCs whose PHY is already a mode switch (e.g. SM8650,
SM8750) may need the same property on their controller node (not
tested).

Related fixes sent separately: "phy: qcom: qmp-combo: Leave the USB PCS
alone in DP-only mode" (suspend in DP-only mode) [2] and "usb: typec:
mux: fsa4480: Keep the USB 2.0 switch on in DP-only modes" (boards with
an FSA4480 on the USB 2.0 pair) [3].

Patch 2 conflicts with Vladyslav Tymoshchuk's "usb: dwc3: qcom: Defer
VBUS override update during system suspend" [4] in
dwc3_qcom_pm_suspend() and dwc3_qcom_pm_resume(). Both add a lock
there. Like [4], the mux callback defers the QSCRATCH write while the
glue is suspended for system sleep. On top of [4] the two locks can
become one.

Patches 1-2 are for the USB tree. Patch 3 must not be applied before
patch 2: with "mode-switch" on the controller and no mux registered by
dwc3-qcom, pmic_glink_altmode defers its probe indefinitely.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with the series
backported to v7.3, plus [2] and [3]. A USB-C monitor ran over 4-lane
HBR3. Its USB 2.0 hub worked after 10 replugs and after a plug-in during
s2idle. In the s2idle case the mux state came after resume, so the
deferred clock switch was not exercised. With the monitor
unplugged, a USB 3 stick enumerated at SuperSpeed. Quick replugs (under
a second) worked 9 times out of 10. The other time no PD contract was
made, so no alternate mode was entered.

Changes in v2:
- Patch 1: use the common usb-switch schema
- Patch 2: switch back to the PIPE clock in the mux callback, when a
  USB state follows the safe state. v1 waited for the next role change,
  which can come before the mux state (Sashiko)
- Patch 2: keep the UTMI clock on a change of pin assignment while
  DisplayPort is active, as the PHY keeps its mode then
- Patch 2: while the glue is suspended for system sleep, only record
  the mux state and select the clock on resume
- Patch 2: depend on TYPEC || TYPEC=n. Skip the mux without
  CONFIG_TYPEC. The arm64 defconfig has USB_DWC3_QCOM=y and TYPEC=m,
  which failed to link (Sashiko). It now builds the glue as a module
- Patch 2: no change to the role notifier
- Patch 3: note the dependency on [1] for the PHY's "mode-switch"
- Patch 3: add Reviewed-by from Abel
- Link to v1: https://lore.kernel.org/all/20261102215121.738-1-26rote@gmail.com/

[1] https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20261023123512.1912-1-26rote@gmail.com/
[3] https://lore.kernel.org/all/20261022165143.1327-1-26rote@gmail.com/
[4] https://lore.kernel.org/all/20261018143126.3978-1-tvlad744@gmail.com/

Joonhoe Kim (3):
  dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
  usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only
    modes
  arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode
    switch

 .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       |   1 +
 drivers/usb/dwc3/Kconfig                      |   1 +
 drivers/usb/dwc3/dwc3-qcom.c                  | 103 +++++++++++++++---
 4 files changed, 95 insertions(+), 13 deletions(-)


base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0

