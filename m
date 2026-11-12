Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483524;
	b=tSnshdaYomvOhNaaGOLjGk4bMWZ5jX/1NyC9JogXeOOWVE7UPtA52UTa2TRDkcNZ5CLv
	 U9z5F+HG9Fs+G41C8hr+KG3QI1cEV4v+48U7Jw5RcwmwRwRZIpuhz8833oesYBlyTriX7
	 26A5n4PA1e6i3LPtDe9WNScSpCV0WbMxuOSakTkcnxsDIViOmqB5XrCSlXQe08Khhxs6R
	 /MO+zpmZlqOzApH3MrVP4dxpjhzPJRFU5tfKF9xgztwgpZVf1nCXa+UbRPPUsTS0vGBEB
	 Flu7+JFykF5MO7l0YLsqhgaJ6ke9/q1kY8XwvVg+ScWLKjBqW5qWBINIJOv9jaStZeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JrAN4L0V2AAunfW2Nn6egAbHFdktLmN/R6cT5SYYnmw=;
	b=R2AZP0IakjJPot2Q1WMYQ51uOuEPCGfuxQYVA/j9vrMrIQhitn0OvQqG1lISzaaxiOzA
	 mwQp9cE3L6dh9psYRy1DarqHB/2wI1HNfzwNu01DyaULgBnVMPojU30vgk8XKuZ7fC5De
	 VDPepOyb0H1wOTnSgvqYyEqhzlKBCp7XDgz2fMDZec/rex0RjcfQIThGZqK6ZGhjPKvhJ
	 LK12ZRbuaxs7vfKAzTlmBd1SjIEprH5GW/FdTWV0yKcCthc80FRkwrdA0WrPZ1nCisgh4
	 SmK6RR7KFW/ebR+S2jvNPmbEjqvN9Y8dvvnG7XIXmoA85DjbCB3HApg38NgmHesYKXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhhretRk;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB2F606A327
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAB2F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhhretRk
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37628596783so4184747eec.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 03:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483523; x=1795088323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JrAN4L0V2AAunfW2Nn6egAbHFdktLmN/R6cT5SYYnmw=;
        b=EhhretRk7oPtkW23vp1w8LW0E5tl4AX4P8bITmTeOn28qxthfwY+WrK6e+caqxJTPm
         x8r+XCRIAt+DhMA8e6DUBhimfaq9nQFHNe298u2ZPTklN+Ao4yy7XismsZmbgEgjsUvv
         7ZaX2SJwbXebmSFabnEJ+CUxwPZuX+8z1RkxtdUHkOcJacDdUroGiOjN2lbJt3CQaWOV
         ylxMXOKBvrkckAqa72fIhTcheA3E9xpCOGjjebjJR/RaxsKnt1IkMvQnOKa+jXZAij9S
         qkvYaIuDpa8yRsVNxSE21k0GGzz39qeyeGaeeD4iBt59yO4Hg4s3XIjRZ77/oKKtRFax
         13pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483523; x=1795088323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JrAN4L0V2AAunfW2Nn6egAbHFdktLmN/R6cT5SYYnmw=;
        b=N8FovAQfcahHXHAC+p9wbg7GeZMJziHolIOFSjIlc/nXSyGL5idpoNcX7chxCXMwJo
         we15BSo2awavwQDyr3rY1eRujGFuNIEge2aaxXrB7/gix7eB39DKR/NxFuFbRQWeDmG2
         uGOb1bunk+NM1aGNqdOTpQnmYsVkqEPD/IkseVbZqKrwT9iOd6wDRxSUYAVdkud4Sb2b
         IS0gIA3ELuQrjJY66PCME4/SPxpbNKiQXbbIxxcUvbVLTFRK7JkaSRoynAoEya+xoeMa
         hVJVzX2SUhDAooTR+nxxq2V3ECaP+MhdKFxnPxhA4QedVApwIhC6s/QNuCdFnnG/BMcO
         HnfQ==
X-Forwarded-Encrypted: i=1; AL+hErFy79fE4bKe/iJtgEoQ+w95vOfMxTFQ2ievTJOh2ncRmTw7m3unZhP1DOG+98gunt1vOmhYGFtbNKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/97o1POGg0lfgVlojtCxwuQwvuFblrfFHioCb4Ycg90YSwb9/P
	tuQ28KRs0ucoaluLn1FyiWSjI4bHhL/jU3E5EqYOXnPfkOuy8fNxkVdg
X-Gm-Gg: AYBFou1aI6mFj34xaHqUERtZW+PV12PW5VBUQ8/eoyZ6P/MPR5N+L3BvBttewCRTHjJ
	gbFZDXPnk81OJPPY0ksZhZxTVHwALHhNs2b2F8b8Ftb8A3jXsAkqfi1pAkdVzTMv1uTSSfRZHRL
	FHHkjs9GEioli94xMrS/qA7BEr9tP3KRAY8/UEJd1pHQSqCGGniU2PGWydkEbmoiD6fzbYXFpbL
	BOcvzowGbhWJVclktlGK4iWBOjAhO/R3sBLsP/Zq+9KPu1Q0sTUfsYp8bz8ceBooWBYkQaY2dPB
	5S6WLG3c4xPWivAbuVhb38LDSy6ooKaUIfA0ZdLyIXJbUIBe9geUVZldLeMbUhsDjj82eCFV5/V
	AcQ4gMZ36CLM95AF4zIRgEph1/2u+qjg4ZR09Lvm2BsjuFyOaPIfIrH4fLwtQakmSavMXInjYxp
	2OFdWAndIjN6efSSVnQpKdwo8Mnv8b8EsMuOe2h6R2QkrPtWy4AFPDDan9PKbIowWJzUBNWXXiV
	K5k9qm8XgVQ+Ws0/PwTx8OyBoUMYwYaNvAkT7bi3RHo4FeQJV61B2MMwFzbFPk7ILXlZ7JQbW4f
	DLDEGYCxdaAAgWpiuefiDGi2cL3VHLZpClKxVDjS7A==
X-Received: by 2002:a05:7300:7f27:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37685c7a324mr5685022eec.23.1794483522522;
        Thu, 12 Nov 2026 03:38:42 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm27149036eec.20.2026.11.12.03.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:38:41 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Thu, 12 Nov 2026 20:38:36 +0900
Message-ID: <20261112113838.506-1-26rote@gmail.com>
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
PCS powered down. The USB 2.0 pair still works, and such monitors
often have a USB 2.0 hub, but the dwc3 controller still runs from the
USB3 PIPE clock. On Kaanapali the next xHCI reset in this state times
out ("Host halt failed, -110"). USB stays lost until the cable is
replugged.
Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk on/off to
common") keeps the pipe clock branch enabled. That is not enough here.

This series registers the dwc3 glue as a Type-C mode switch next to the
PHY, so that it gets the mode (it does not route any signals). In
DP-only modes it moves the controller to the UTMI clock, as
"qcom,select-utmi-as-pipe-clk" does statically, before the PHY
switches.

On Kaanapali the PHY becomes a mode switch with Balaji Kalkonda's
DisplayPort series [1]. The controller side for that SoC is a DTS
patch sent separately to the Qualcomm tree. Other SoCs whose PHY is
already a mode switch (e.g. SM8650, SM8750) may need the same property
on their controller node (not tested).

Related: "phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode"
(suspend in DP-only mode, sent separately) [2] and commit 89aaaa26f698
("usb: typec: mux: fsa4480: Keep the USB 2.0 switch on in DP-only
modes") for boards with an FSA4480 on the USB 2.0 pair.

Patch 2 is on top of Filippo Falezza's "usb: dwc3: qcom: Restore UTMI
PIPE clock on resume" [3]. On SM7250 QSCRATCH loses its contents in
system suspend, so patch 2 reads the selected clock back from QSCRATCH
instead of caching it. On Kaanapali QSCRATCH keeps its contents. [3]
is still under review and may change; patch 2 will be rebased if it
does.

Vladyslav Tymoshchuk's VBUS override fix [4] also changed
dwc3_qcom_pm_suspend() and dwc3_qcom_pm_resume(). Its next version
moves the change to the dwc3 core, as Thinh suggested, so it should no
longer conflict with patch 2.

Both patches are for the USB tree. The Kaanapali DTS patch, sent
separately, must not be applied before patch 2: once the controller
node has "mode-switch", pmic_glink_altmode defers its probe until
dwc3-qcom registers the mux, which never happens without patch 2.

Patch 2 makes USB_DWC3_QCOM depend on TYPEC, so with the arm64
defconfig (TYPEC=m) dwc3-qcom is built as a module. With "mode-switch"
on the controller, pmic_glink_altmode then probes later, and its first
HPD event can arrive before the DisplayPort driver has enabled HPD on
the aux-hpd bridge. aux-hpd drops that event, so a monitor attached at
boot is not detected. Yongxing Mou's "drm/bridge: aux-hpd-bridge:
replay last HPD status on hpd_enable" [5] addresses this; it was seen
on X1E as well.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with the series and
[3] backported to v7.3, plus [2] and the fsa4480 commit; the boot test
also had a variant of [5]. On each DisplayPort entry the controller
switched to the UTMI clock before the PHY switched, and back to the PIPE
clock on the next USB state. The monitor's USB 2.0 hub enumerated after
each of 5 DisplayPort entries, 3 of them on a replug less than 2 s
after the unplug, and after each of 3 s2idle cycles with the monitor
attached. Two other plugs stopped in USB PD negotiation, before
DisplayPort was entered. With the monitor attached, rebooting worked
(2 times) and DisplayPort came up at boot (2 boots). In these tests
the mux state came after resume or needed no clock change, so the
recorded change was not applied on resume.

Changes in v3:
- Patch 1: drop the mode-switch line and disallow orientation-switch
  and retimer-switch (Krzysztof)
- Patch 1: say that the controller only needs the mode and does not
  route any signals (Krzysztof)
- Patch 2: rebase on [3]; compare with the clock selected in QSCRATCH
  instead of a cached value
- Drop the Kaanapali DTS patch from the series. It is sent on its own
  for the Qualcomm tree (Krzysztof)
- Patch 2: check the safe state before the altmode, as the safe and
  USB states can come with the DisplayPort altmode (Sashiko)
- Patch 2: always select the UTMI clock for pin assignment C or E
  (Sashiko)
- Patch 2: do not resume the glue from the mux callback. From the start
  of a runtime or system suspend until the core has resumed, only
  record the state, and apply it on resume (Sashiko)
- Patch 2: leave the clock select alone on nodes without a mux
- Patch 2: only record the state once remove has started
- Link to v2: https://lore.kernel.org/all/20261103135057.1682-1-26rote@gmail.com/

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
[2] https://lore.kernel.org/all/20261103135051.1668-1-26rote@gmail.com/
[3] https://lore.kernel.org/all/20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com/
[4] https://lore.kernel.org/all/20261022224220.480-1-tvlad744@gmail.com/
[5] https://lore.kernel.org/all/20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com/

Joonhoe Kim (2):
  dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
  usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only
    modes

 .../bindings/usb/qcom,snps-dwc3.yaml          |   5 +
 drivers/usb/dwc3/Kconfig                      |   1 +
 drivers/usb/dwc3/dwc3-qcom.c                  | 154 ++++++++++++++++--
 3 files changed, 142 insertions(+), 18 deletions(-)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
prerequisite-patch-id: a793fca7329dac964c21459f8d7a8b003d36d84d
--
2.43.0
