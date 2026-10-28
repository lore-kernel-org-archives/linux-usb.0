Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213987;
	b=08WYNU8uTsvvuL5qj8QZ0nenJWSNXhdWj041JYdhD1yQnubFpduy8q9fDkjotOAZHYRk
	 bYgtGQvFXfoMmm9RHfzfJFLsyRHHg0qxFVdomPu3f4Ga+XaqOZfn+ehWqKBhlgz1zZ2o9
	 /sVKvSZu9Sb6k2JsWQqEJLRsuM9WgSBb/6fyj4s2Va9kRxpfrFBUPf2MGhp1gjIRaZDS7
	 VuGo61zbRbDcrKU9spvmymlWwX1AnPLDCsNXXcbKBhOMiMmlfK61txQHKw4BEAIArUuZ6
	 PL+tONppNABcdN//zot73O/xarpQpmtkTmjjaPGQEKpzSt0WSBQOGZVyxxpHU8vUN9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213987;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=waaba8jCPpj046XQzEGRZ7ChM7NZX18rUY/mNtIXVHQ=;
	b=Cv1n9pWbyKZiovWt1ej+zH0fcIrYDkifQC9SbK6N7pfcCsHTDtDOxjO8lGkRb5VH1/AQ
	 rYUchvmatvgYd5zFoC9E98AKrpkCsa7tevUuHdGWurZ5+31qAGndzygKi4Oyb3e0EupBX
	 s2hxtQvbzdtO9v5ljxh0Ult5Oi5I+XsvByVPoblApkZKi7wdMgsIoE657pZbhSksH5tCv
	 OLkX66Rv+xTHpgo3c7NdXFKHnA6C0qlbRjLINuw9tyiM7sxnqiPqqFnlM/zsBTygXSVYw
	 XbNcZKAsN69fLqZYyeuwRNMZyttUuT1AK1W1d4WmzqYbsx66de1nhL1fqOzDcVWhCqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOdkbtbQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hhHM4X7C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A0D606A31D
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76A0D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOdkbtbQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hhHM4X7C
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIcLXk1918602
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=waaba8jCPpj046XQzEGRZ7ChM7NZX18rUY/
	mNtIXVHQ=; b=kOdkbtbQ8hciz4wTHRAy9u0SMvy7oasBoiYNe/uH6/9PhpqeMhW
	Xy8/dwFtm8BYa6J/rx8kIEK1aDi6VwWxvnng49m5Gs+eX4A1JWm9ViQP6F0CnSOG
	BR8Mx0taidVWZ88GDiyMqlebPKyDyYYmTUHcFJo3mzBGDncDUchIR93uT8/TZQyS
	Oz4C+l6TecCgBNRntI/favkQCBXP7dsMmKz8GZhIY6L9d7myvuzG6qBSrBrCURHx
	lvHaIoCgM08cer/gw03mYiMbYwZIprfwlKOjvclKs0pSFJhOLlWUXxEYf3RYeM/L
	H//24S5tuIrO+ygTSo5eDwCSOtI0bwFvH4Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpr2v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:59:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso1694927eec.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 11:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793213984; x=1793818784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=waaba8jCPpj046XQzEGRZ7ChM7NZX18rUY/mNtIXVHQ=;
        b=hhHM4X7CjVv7Pkht/nKZBukUgLd6W8U4Yarx3GkExx+DNKlPMmaL5rMgXebnupE+3G
         ry2DEWfwARoKgwyYi/S49J4JbZkKh73oFrwJ7F1T1u1UbEJo+oHbSvvf+6uiGsEF+0p2
         hemsFi2Blz3pJVWVnsztA0qlBhjCqcO8CYoOsmHc8On3Qhe4fLGlqiuwu/alGS1BIWMU
         ryJck50z6ngWVos5B0fJM4GgsswX/zdg/5iEpx0tE2KUaQY/uSd4wkVczjR08veTAvkQ
         CvL2okcSmefTQkZf9mavzyayDd8gYpWKw9A3c6Re/5qC0L9kEn8z038LX4PXpueUfev6
         9vZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213984; x=1793818784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waaba8jCPpj046XQzEGRZ7ChM7NZX18rUY/mNtIXVHQ=;
        b=vgifkd+7GWksfJCfQaiqTnhiEEyoet1zt+gjAgpviQ1BzKYFtOcUZwsefwaKKtgdHd
         88tXLDIYQAHMzyjL9niNziYVCUK6j4Lyqr/N9V+BcTBZizol+1ccYwoQC87oosDbyXRF
         nO/o2bC8yYKftAZHFdjmyHDsiHH0o3k6ifLZcBmk/RY2U+xSdfRgLWRz2/MGaTP4ULI0
         KpCePJhCE5+eMbaHUSJ8hi9Mx/Tdh74GGZNt6rnv5HEm73GyHZPCa+PTphzlBTavSH+f
         OmuP7nMoRwkbixiQ0yN8QVoyhSw9rvBL+R/CSn0bQRbn8ABMXwjeNNX0pXy3Rs1duo02
         hkCg==
X-Gm-Message-State: AFq9FYLX8F88tkhZy5/0KP6Z8zFVNX7sjl+4CVCUJWQSc0GRm5zeN32K
	lMHi/a+On23LR37diPFBN07jdRXWHQfOdCXGC80dnsKc9yprMWYzyN2HRj580IszN50eefCuw76
	bicwaqSZFBKZGgTkrksoCSdybFxY+8/owkGXs3pnxAPW8+r+/qktBcdL3dQrMi/688znsMvc=
X-Gm-Gg: AYBFou1S0Mc5NBIb9jx11MEkm47FTy4z4rr7SL/P1GdfzNymizWDcbOzGkJ5/6nWtVq
	cZVD+aOUueucAZ0IRuxl3QHgBEMCOnm/iRd1scWlWVxWI9n6kegCiKAgRYazhPsSfRpa9e7udFL
	vW1k/AvMTjWUvV7Q4MjItuKf5VHlXsk+gZKTzgWkLLlNonIntu45/mOHAiPRnn85qbu0XI9U06j
	8NfDNEDSWNbx+okBnGWh5/6D5/tGLJCXhKiyAF1R4MPPeURDvbdv4oZxGA9ZKQ37iYm52ltPGeG
	RGaeWRWf6+TRGUf2rpx4aioxg0YRch50my4zO7IyNSP/4/I+5Cd8D3JH70NynWadx4XZA7gLiT8
	ZbjS7Nyz4PHxAIlHw59F3teVIG6F/mqHW+1XqJba0lw0VQkt70DeTC/AHhSHgqA5BUXHelpHpnE
	wILwxJUA==
X-Received: by 2002:a05:693c:62c9:b0:36a:3186:b712 with SMTP id 5a478bee46e88-36a3186bb4dmr124091eec.20.1793213983644;
        Wed, 28 Oct 2026 11:59:43 -0700 (PDT)
X-Received: by 2002:a05:693c:62c9:b0:36a:3186:b712 with SMTP id 5a478bee46e88-36a3186bb4dmr124050eec.20.1793213982742;
        Wed, 28 Oct 2026 11:59:42 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.11.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:59:41 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 0/7] usb: dwc3: qcom: Add firmware-managed resource support for SA8255P
Date: Thu, 29 Oct 2026 00:29:30 +0530
Message-Id: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX2w3Mpr37pS8d
 V/tTly4M1ZYldbIq1Ud8nWK/PKANuVM9wKHJ1H85/PTIttCVmkyQBXIyhaEUXQYu3q5Wra3eK7w
 wqfpPS5J7ckAqV/5peNZqeY3WHpNIpm1o0xPCWkFsQyhJfMsgIrt78+a4KcIMdeuDBpq1lPjOVV
 f56IrSpjc1JL1ljPBuoch3vfbmPrpHLaVEnJb8WtnzRUAFDyyt+3olgCyexc8Xj8/I6enV478Dz
 PydpDevbTrI3vrNhOjhupGxr3Dqo/w68MNJz0i+KGF0Tw0AsruouiEjesl4cpkfDSovRpcTnDwC
 BzHSTEAApxWdUv8WcuzFMFLFxCYwQymFPO7XUXimOlnj5KO7O+Q9DcUPlJbDYPTH5HgsosIJG/5
 0PkinmWo4veJzfv5PNkTg0rb4hDWAYIvRHHgbbjvKHUouidPUdJtYO7uGz7lDYss8K09WZ2vvvd
 0KaHZnrlHM3nKRiWMpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX0g+bJ/Mf1A9e
 pibstWtU8e1X+a1VdGPXAZt/5gKa6GHE/JjbHrPtO9JaZbHpPq9ISWs3wSuKYm890LhGUI6+8on
 qbfkK5R7ffepxxmsRAIS9EXPhpwwziU=
X-Proofpoint-ORIG-GUID: rlUFkMbVWIinT_-6KTcGs1J2wgU390od
X-Proofpoint-GUID: rlUFkMbVWIinT_-6KTcGs1J2wgU390od
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae24621 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=B33oJOY4P6F6MnOb30YA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

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

SA8255P also requires a few platform-specific fixups on top of this,
handled by this series:

  - "Broken suspend": APPS/system suspend causes the clock controller
    to cut all clocks to the controller, putting it into a Power-On
    Reset state and losing Qscratch programming. Resume must reset the
    controller, reselect the UTMI clock as the PIPE clock when no SS
    PHY is present, and reassert VBUS_VALID so the PHYs don't fall
    back into suspend.
  - The loss of power across system suspend also leaves the xHC in an
    error state on resume, which the existing XHCI_RESET_ON_RESUME
    quirk handles once dwc3 is taught to request it via a device
    property.

Dependency: this series applies on top of usb-next plus
"usb: dwc3: qcom: Add support to skip phy management by USB core" [2]
from Krishna Kurapati (Acked-by: Thinh Nguyen, not yet applied). Patch 5
sets the skip_phy_init property introduced there and will not build
without it, so that patch needs to be applied first.

Patch overview:

  Patch 1: Track whether the wakeup interrupts are armed so enable and
           disable stay balanced across runtime and system PM, and
           always disarm them on resume. They stay disarmed if the
           resume fails.
  Patch 2: Refactor dwc3_qcom_suspend()/dwc3_qcom_resume() to take a
           pm_message_t instead of a bool, so the runtime-PM vs
           system-PM path can be told apart with PMSG_IS_AUTO(), which
           later patches rely on.
  Patch 3: New devicetree binding, qcom,sa8255p-dwc3.yaml, requiring
           "power"/"bus" power-domains and the USB PHYs for
           firmware-managed platforms.
  Patch 4: Teach xhci-plat to set XHCI_RESET_ON_RESUME from a device
           property.
  Patch 5: SA8255P broken-suspend handling (reset + PIPE_UTMI_CLK_SEL +
           VBUS_VALID fixups on resume). The xhci_reset_on_resume
           property is added to struct dwc3_properties and forwarded to
           xhci-plat, and the glue driver sets it, together with
           needs_full_reinit, through its probe data.
  Patch 6: Firmware-managed "power"/"bus" domain voting for SA8255P,
           wired into probe/remove/suspend/resume, with the probe
           error paths and the system-suspend-after-runtime-suspend
           case keeping the votes and reset balanced.
  Patch 7: Enable the VBUS override at probe when the default role is
           peripheral.

Testing:

  Tested on SA8255P Ride:
  - Driver probe, unbind and rebind
  - Runtime suspend and resume
  - System suspend and resume
  - Host mode enumeration across system suspend/resume
  - 20x system suspend/resume with a host attached to the peripheral
    port: UDC returns to configured, no soft reset failures
  - 20x driver unbind/bind with the gadget enumerated and on the host
    port

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

Faisal Hassan (7):
  usb: dwc3: qcom: Keep wakeup IRQ enable/disable balanced on failed
    resume
  usb: dwc3: qcom: Distinguish PM and runtime suspend/resume paths
  dt-bindings: usb: Add qcom,sa8255p-dwc3 for firmware-managed resources
  usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
  usb: dwc3: qcom: Support broken suspend for SA8255P
  usb: dwc3: qcom: Support firmware-managed resource states for power
    management
  usb: dwc3: qcom: Enable VBUS override at probe for default peripheral
    role

 .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 114 +++++
 drivers/usb/dwc3/core.c                       |   3 +
 drivers/usb/dwc3/core.h                       |   3 +
 drivers/usb/dwc3/dwc3-qcom.c                  | 411 +++++++++++++++---
 drivers/usb/dwc3/glue.h                       |   2 +
 drivers/usb/dwc3/host.c                       |   5 +-
 drivers/usb/host/xhci-plat.c                  |   3 +
 7 files changed, 482 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml

-- 
2.34.1

