Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430859;
	b=jyIec+1oiB56oBwJC21k4qVepnK3FLnajVYtxUh9Tk6VVcpIaZC6tt4aThnwqnsBQy2z
	 cNRsi+SnoHR7Bbb/3qig25MHxb8RKj1P58ZTeq3HTLJaisYtUJPnHyxC/n4n4cqd1Xds+
	 CWaB0oTqRsyF1QfDb3ht8SVQPMyAib/Fb0cOkjMR8e26Sih+H7zk4nbL/sBb927ITVUIo
	 x7KUbkp67ThRrib7otrV0GsRoKHvoMrY2cYiUK6B5iupMy5MxnsGpJl5USEn3sreQji5c
	 GrKSRLFHedMvhdc3rgwYxXETBQB3GJ6KW6WqmUirEaWKRM+H7wFQQRKPE4FJw+20K1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xBnnVmjA8Cg9PME5T36nhN/EQKIWgapeJussjXAgCSU=;
	b=Wk9CCd/KHXUA1mOo6Q9wUXcF7wbVr7lUHyOph10GPuwL3cFv0cv9fx90RY+5HRDLBlWG
	 +sraWJZMfXwnovERJhJU+UUA7bWbL9QWDIUTQsvGdo43rnzSPNFuGc/wDzwzm/q37EFS5
	 PBusCbs6MEXCFinTURrH4Q3Dj5k1vZvj7MJezm9ogIudIAQ7aq0CTaDZZi+jhNauXGxXs
	 d+sB/pHMsXgpBv1j7L0g8u4X9IiLp4ZtWCYXUeK7Lx0YOQ0ENwk3vVJfh8xwqNmn6UsxX
	 /fZ26IviolCqPKsWH5MKVWRhs3KmcRQnGXhzXijHivsYwdSoRNrRk251/jKwEWeBMDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YrWl6Yo7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cmvibWAe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BEE606A321
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BEE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YrWl6Yo7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cmvibWAe
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fuq11828528
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xBnnVmjA8Cg9PME5T36nhN/EQKIWgapeJus
	sjXAgCSU=; b=YrWl6Yo7IOsbV7yQQ43LN8BuOG8SZjI/L0JUPEwmSRpH1gcWxVE
	oqzWy8Kj+y9IqBgHe1HBY9OmJ26Gg0JBNU2ODdR8RgnyCP4liTaxlsqh/Xn1aVX+
	HHQl1SEjOtG0e1Raq3Iv22Le1dr6HHUitmiQoeymsuPlvcidupag3YWIE13+DHoo
	+qR2D4kIcmP/o9SsZR1/nZp2LhY/4V9VWqj8de/Qg6mH/j2TZWxAToOJEc5QPuV8
	gkDijhtGobciQbe0K/eqBcfpzosl8dwYNGT+4XsB1bv36rNK4EsIqIw0v7KEONK7
	3q2WjdXaZw0zvJjW8hrwTgYvfKLck37KYqg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p8yud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:47:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb96533adfso1872414a12.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430857; x=1796035657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBnnVmjA8Cg9PME5T36nhN/EQKIWgapeJussjXAgCSU=;
        b=cmvibWAeCjHsxyJTkW7OQUICgGCST1YMzAd8kza/JWJODVeVBJUh67DGWJGNMO1IVU
         WV5mJcYRrxekmMdnmMGs5DY3gKA1Ays94MBABNTiR7cV62bJ8pjs0g0atFT1m4HB8NjM
         j0fpGsO1gEShcqEYiquSTUfyyAHwfYW4gv1VPHmj2UPWz1kkHyCxi3OAexo1oMkc9kzh
         P/2yUlwZ4JUwMnwAZUBCThznYbe3j5xG0BbQfaJNsF23fi2CAcMIrt1/ovL12M42b5qE
         M03toZ8ZbO/dsDFMfL1SGP/ctPAs/UTuWanWNinlA4XsPzl0igGabVI8rx4KpwAq6QeE
         QG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430857; x=1796035657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBnnVmjA8Cg9PME5T36nhN/EQKIWgapeJussjXAgCSU=;
        b=tQY+OKNc52cMo7jrbmugYCIMA2uwqOMpRunkdQKeNKlORVtF7U6YBMpQQ8tVGclrWL
         nWq7ts7z9HFKznAVJf4Sl+exk3tEBg69qobAWgLfiinlY5Qd9A3hwdDu6DOYh8uR5vWt
         VyTb4zsBDivHF+o1FJUe8vuQyGNNfKrvtMGqXMclpyKDJYa9dUawxvrWtuoYt0CYlAiu
         BymoRc48TYDF/ic3UijiuY26SMQhbKnZLIroMw7uR8RqKUi2g5e3brvt4oiMuUAN2duw
         BPpmVRD8dsJfnFkFadWgO3PhKcDtLAh9Q5COnPgvljIk9VZR5+D6QX4lVhRXSKya8OhR
         DNAA==
X-Gm-Message-State: APuU4Z/BrCawYAB9XsXVI9PibPyP7Hk+XfDw/MlFiKuvZ4slPoIe5R4L
	Lf+paBJL4pk7CGg4yu4qa4A7yeyh/stGtXPe+W5s3q6CeQzZyMnP01SQpLJKF4X7TlJB27kup6p
	VIBVk5shdDfcq45opr1MOGyG2WYU8rE7sKZl4GAiYuNPEy0AE94zF60Skij73GAo=
X-Gm-Gg: AZFdTZcMdf8WISupJ8RZaTAcjKD9FGnwczasLVmWyPvSeF5WbVVzc82ngIfMC8YFYzJ
	iVG6mh2qWtvbu6fs962uTHHGi+AVMNgo6Tn2gRBKwPfg28qTBQfKKYRPy8JOPLLMzmedLNg4Idb
	/9TReQba7d7QNvs9G5IhwTyJLVKkOdn7jmypq8XrNFl/Cv2xPUcfbgrvh4s9M+iCSIMHriC5iWU
	16s/fbbljUatc5yO+aUVKuF6Nt23fqzmhnGFFqd+8K4mDNOrb6GAYYbG+9qbvqkt1IkX2VJ4/y5
	mM1IA/b/FWkSQSJopdLh0U7dIMg3DvCUzCzIA/TRrkHxmlwd5X/ja9YsppYu011fWZNeVSWlPCg
	RgdfzwUonM+h3XYGf4O21FLuaxm3MY4RAZOR4iv0VkAJFto+eU4W7nXF0x9okopmQWEEz1nN1kI
	rci9MUpQ==
X-Received: by 2002:a05:6372:a705:b0:3e2:7c10:d465 with SMTP id adf61e73a8af0-4014e358b53mr7569173637.83.1795430857077;
        Mon, 23 Nov 2026 02:47:37 -0800 (PST)
X-Received: by 2002:a05:6372:a705:b0:3e2:7c10:d465 with SMTP id adf61e73a8af0-4014e358b53mr7569154637.83.1795430856464;
        Mon, 23 Nov 2026 02:47:36 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:47:36 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v5 00/11] usb: dwc3: qcom: Add firmware-managed resource support for SA8255P
Date: Mon, 23 Nov 2026 16:17:15 +0530
Message-Id: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXys99qybifoGe
 vm4Aon3afiRGGpNjc4w2/1QkdcRjHeFXf417G3+Jqv4AlBv42b+OBD9Gyl3v8jKx/oAfjF8UwKQ
 3LpYYkIssLDI9nErkk33OEAN9jkLokEQzBV+oSD5aO8NK7ufJyYNjFoXQFhbJ9pUSSyE8EBHVC7
 GqGxmN8H0g7GO7jDK+dPaDFs95XdhxBtD0VrxEi33z3yPimvYpF5UnZwlbVtP7WElNC6iF0ejLX
 OMjHSkS9akU8pBobd9CrN4lkDVvJrHhH1iEx6dIKZmh4z6RuDXVLyOXt0S3H3Tt7avCgnRV7quR
 zsOPD5DGkA/W4vJ/uFHv2GSfCLuMNmUFbHU6n8SXKtPbCWBy6E5Au/lFlUTpJjUNAKhir+NR9D5
 r5S0aoN2pTZLiBeZ7aaxgujbH1nDDJUP4bf06LXh2XMbRjXidjNoR9ukTZmsC8Cf176VHmWROla
 zuqXqaEyskUji4pew+A==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0419c9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KySitE5FWxHOadyUSu4A:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: IRMgK-aNEauFkyZHv72NAMhFsPIZ3NXb
X-Proofpoint-ORIG-GUID: IRMgK-aNEauFkyZHv72NAMhFsPIZ3NXb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXzXa2vY911Z7b
 zgCFDhWrOn4pvL2vMq9xfrCMGc4UNCoofd66sn7OTDD2P4GNlYXa7rreBMBIbA249mK2yeDDavf
 Vu+OduPTYCYbxlStkSgAIMloblgKaRU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

On Qualcomm automotive SoCs such as SA8255P, the USB controller runs in
a Linux VM while the platform resources that the controller depends on
(clocks, interconnects, resets, regulators and the GDSC) are owned and
sequenced by firmware running in a separate VM:

    +----------------+          SCMI          +------------------+
    |    Linux VM    |  <------------------>  |    Firmware VM   |
    |                |                        |                  |
    | dwc3-qcom.c    |                        | clocks           |
    |  "power" PD    |----------------------->| interconnects    |
    |  "bus"   PD    |----------------------->| resets           |
    |                |                        | regulators/GDSC  |
    +----------------+                        +------------------+

Linux has no direct access to these resources; it can only vote for
two abstracted power domains exposed over the SCMI power-domain
protocol:

  - "power": gates the power supply (GDSC) to the USB controller
  - "bus":   gates the clocks and interconnects used for data transfer

Register accesses through the controller require "power" to be voted
on; "bus" additionally requires "power". The vote policy implemented
in this series is:

  - Enable order: power, then bus
  - Disable order: bus, then power
  - Runtime suspend/resume vote only "bus" -- "power" stays on so that
    accesses that can legitimately happen while runtime suspended
    keep working.
  - System suspend/resume vote both domains.

The two domains are attached with PD_FLAG_NO_DEV_LINK because runtime
suspend and system suspend require different supplier states for the
same consumer, which a plain device-link cannot express; the driver
manages the runtime PM references for each attached domain explicitly
instead.

SA8255P also needs platform-specific handling on top of this. Automotive
platform requirements call for powering down the controller's GDSC and
entering VDDmin on the APPS side during system suspend, so the
controller loses all of its state, including the Qscratch programming,
regardless of whether wakeup is enabled. Runtime suspend does not remove
power. System resume therefore has to:

  - reset the controller and have dwc3 core reinitialize it
    (needs_full_reinit),
  - reset the xHC, using the existing XHCI_RESET_ON_RESUME quirk, which
    dwc3 can now request through a device property, and
  - restore the VBUS override when the controller is not in host mode.

Dependencies: this series is based on usb-next plus
"usb: dwc3: qcom: Add support to skip phy management by USB core" [2]
from Krishna Kurapati (Acked-by: Thinh Nguyen, not yet applied), which
introduces the skip_phy_init property and the property array size used
here, so that patch needs to be applied first.

The PIPE_UTMI_CLK_SEL restore that earlier versions carried is dropped
in favour of "usb: dwc3: qcom: Restore UTMI PIPE clock on resume" [3]
from Filippo Falezza, which is still under review. That restore has to
run after the controller reset added in patch 7, as the reset returns
Qscratch to its defaults.

Patch overview:

  Patch 1: Refactor dwc3_qcom_suspend()/dwc3_qcom_resume() to take a
           pm_message_t instead of a bool, so the runtime-PM vs
           system-PM path can be told apart with PMSG_IS_AUTO(), which
           later patches rely on.
  Patch 2: Disarm the wakeup interrupts when system suspend runs
           without wakeup on a runtime-suspended host, as they would
           otherwise stay armed as wakeup sources.
  Patch 3: Track whether the wakeup interrupts are armed so enable and
           disable stay balanced across runtime and system PM, and
           stay disarmed if resume fails.
  Patch 4: New devicetree binding, qcom,sa8255p-dwc3.yaml, requiring
           "power"/"bus" power-domains and the USB PHYs for
           firmware-managed platforms.
  Patch 5: Teach xhci-plat to set XHCI_RESET_ON_RESUME from a device
           property.
  Patch 6: Add xhci_reset_on_resume to struct dwc3_properties and
           forward it to xhci-plat.
  Patch 7: Recover the controller after power loss in system suspend:
           reset it on system resume, set needs_full_reinit and
           xhci_reset_on_resume, and skip direct_complete so the
           resume callback always runs. Replaces broken_suspend with
           power_lost_in_suspend.
  Patch 8: Restore the VBUS override after system resume.
  Patch 9: Assert the controller reset on remove and probe failure.
  Patch 10: Firmware-managed "power"/"bus" domain voting for SA8255P,
           wired into probe/remove/suspend/resume, with the probe
           error paths and the system-suspend-after-runtime-suspend
           case keeping the votes balanced.
  Patch 11: Enable the VBUS override at probe when the default role is
           peripheral.

Testing:

  Tested on SA8255P Ride, with usb_0 in peripheral mode and usb_1 in
  host mode:
  - usb_1: runtime suspend on device disconnect and resume on connect,
    system suspend and resume with the controller active and while
    runtime suspended, and 20x system suspend/resume
  - usb_0: runtime suspend after unbinding the UDC, system suspend and
    resume with the gadget bound and while runtime suspended (the host
    re-enumerates the gadget), and 15x UDC unbind/bind

  System suspend was run with pm_test=platform, so the SoC did not lose
  power. Recovery after a real power loss and remote wakeup from system
  suspend were not tested.

Changes in v5:
  - Patch 1: moved to the start of the series; carries Acked-by from
    Thinh and Reviewed-by from Krishna.
  - Patch 2: new; disarm the wakeup interrupts in system suspend when
    the device is not wakeup capable. [Peter]
  - Patch 3: now follows patches 1 and 2. [Peter]
  - Patch 4: no change; added Reviewed-by from Krzysztof.
  - Patch 5: no change; added Reviewed-by from Peter.
  - Patches 6-8: the v4 broken-suspend patch is split into the dwc3
    xHCI-reset plumbing, the power-loss recovery (broken_suspend is
    renamed power_lost_in_suspend, and the PIPE_UTMI_CLK_SEL restore is
    dropped, see above) and the VBUS override restore. [Peter]
  - Patch 9: new. The controller reset on remove and probe failure was
    part of the firmware-managed patch and now applies to all
    platforms. [Peter]
  - Patch 10: attach the domains with devm_pm_domain_attach_list(), hide
    the firmware-managed handling behind the resource enable/disable
    helpers, return early from dwc3_qcom_interconnect_init(), and index
    the domains with an enum. [Peter]
  - Patch 11: program the VBUS override once, after the initial role
    has been determined, instead of from the role-specific branches.
    [Peter]
  - Link to v4: https://lore.kernel.org/all/cover.1793212717.git.faisal.hassan@oss.qualcomm.com/

Changes in v4:
  - Patch 3: addressed Krzysztof's review of the binding. [Krzysztof]
    - Fixed the interrupts to exactly six, with the names listed in the
      schema, instead of a variable count.
    - Fixed phys to two entries, named usb2-phy and usb3-phy, and made
      phys and phy-names required.
    - Dropped the redundant minItems from power-domains and the
      explicit "clocks/interconnects: false" properties.
    - Kept "bus" as the second power domain name. Unlike the "perf"
      domains used by other sa8255 bindings, which are SCMI performance
      protocol domains with OPP levels, it is a plain SCMI power domain
      that is only switched on and off. Noted this in the description.
  - Updated the patch 3 commit message to match the binding. Rebased on
    the latest usb-next; no other changes.
  - Link to v3: https://lore.kernel.org/all/20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com/

Changes in v3:
  - Dropped the software node used to pass xhci-reset-on-resume from
    dwc3-qcom to the dwc3 core, together with its probe/remove
    handling. The flag is now a field in struct dwc3_properties
    (xhci_reset_on_resume), set through the glue driver's probe data
    and forwarded to xhci-plat by dwc3 host.c. This avoids the software
    node lifetime problems that led to the revert of the earlier
    approach. The old patch 5 is merged into the broken-suspend patch.
    [Thinh]
  - Renamed the flag to xhci_reset_on_resume and placed it with the
    other quirk bits in struct dwc3. [Thinh]
  - Depend on Krishna's skip-phy patch [2]; the property array in dwc3
    host.c now has 9 slots (8 properties plus the terminator) to cover
    all quirks that can be set together.
  - Patch 1: changed approach. Instead of re-enabling the wakeup
    interrupts when resume fails, track whether they are armed
    (wakeup_irqs_armed) so enable/disable are idempotent, and always
    disarm them on resume, not only for host mode with wakeup enabled.
    On a failed resume they stay disarmed, since a level-triggered
    wakeup line could otherwise keep firing.
  - Patch 2: dropped the wakeup value derived from the PM message in
    the resume path, as patch 1 now disarms the interrupts
    unconditionally.
  - Patch 3: interrupts were minItems 1/maxItems 6 and are now
    minItems 5 with the names listed in the schema; added dma-coherent;
    dropped the free-form descriptions of power-domains,
    power-domain-names and resets.
  - Patch 5: also set needs_full_reinit so dwc3 core re-initializes the
    controller on system resume even in host mode with wakeup enabled;
    restore Qscratch (PIPE_UTMI_CLK_SEL, VBUS_VALID) on every system
    resume rather than depending on wakeup, only forcing VBUS_VALID
    outside host mode, and never on runtime resume; skip
    dwc3_pm_prepare() so the resume callback always runs.
  - Patch 6: dwc3_qcom_domains_put() no longer returns an error: the
    runtime PM usage count is dropped even when put_sync() fails, so
    failures are only warned about and cannot unbalance the next vote.
    System suspend of a runtime-suspended device now also drops the
    "power" vote that runtime suspend keeps, so system resume stays
    balanced. Probe error paths now assert the reset again. The
    remove path is simplified accordingly.
  - Patch 7: new.
  - Link to v2: https://lore.kernel.org/all/20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com/

Changes in v2:
  - Reworked the resource model from OPP-based performance-state
    voting to plain power-domain ON/OFF voting via "power" and "bus"
    domains, addressing Bjorn's objection that OPP levels conflate
    performance-state selection with power-state signaling. [Bjorn]
  - Documented the PD_FLAG_NO_DEV_LINK rationale (asymmetric runtime
    suspend vs system suspend supplier state) in the firmware-managed
    patch.
  - Validate the number of attached domains against what was
    requested instead of assuming attach always returns exactly two.
  - Fixed an unwind bug where a "bus" domain enable failure during
    probe would return without dropping the "power" domain vote.
  - Added the new qcom,sa8255p-dwc3.yaml binding.
  - Terminated the broken-suspend software node's property array and
    fixed a bug where the software-property walk in dwc3 core did not
    continue past the first match.
  - Fixed dwc3_qcom_resume()'s broken-suspend reset to only fire on
    system resume, not runtime resume.
  - Link to v1: https://lore.kernel.org/r/20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com

[1] v2: https://lore.kernel.org/all/20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260914-xhci-skip-phy-init-v1-1-9c46b31a5a39@oss.qualcomm.com/
[3] https://lore.kernel.org/all/20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com/

Faisal Hassan (11):
  usb: dwc3: qcom: Distinguish PM and runtime suspend/resume paths
  usb: dwc3: qcom: Disarm wakeup IRQs on system suspend without wakeup
  usb: dwc3: qcom: Keep wakeup IRQ enable/disable balanced on failed
    resume
  dt-bindings: usb: Add qcom,sa8255p-dwc3 for firmware-managed resources
  usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
  usb: dwc3: Support resetting the xHCI host on system resume
  usb: dwc3: qcom: Recover controller state after power loss in system
    suspend
  usb: dwc3: qcom: Restore VBUS override after system resume
  usb: dwc3: qcom: Assert controller reset on remove and probe failure
  usb: dwc3: qcom: Support firmware-managed resource states for power
    management
  usb: dwc3: qcom: Enable VBUS override at probe for default peripheral
    role

 .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 114 ++++++
 drivers/usb/dwc3/core.c                       |   3 +
 drivers/usb/dwc3/core.h                       |   3 +
 drivers/usb/dwc3/dwc3-qcom.c                  | 355 ++++++++++++++++--
 drivers/usb/dwc3/glue.h                       |   2 +
 drivers/usb/dwc3/host.c                       |   5 +-
 drivers/usb/host/xhci-plat.c                  |   3 +
 7 files changed, 453 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml

-- 
2.34.1

