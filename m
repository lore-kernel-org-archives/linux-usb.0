Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34E840A920
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791610388; cv=none; b=BaLFdU4f6W3hd6YI55+Qv33fM6RP1OS2VqdhsFwk24cxo9YtBATvwIs5qFi37N7FKuU0CAfWE52nN+/7Q3li0d5O0WEju6IBMaOyVSLPfL0Y/Hwek3jEMgZ5jbI7iJLBYDb3RZ9SWsBOfxKCxqEYdNxnaP1VpcUspHvlaGZzvBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791610388; c=relaxed/simple;
	bh=YCHl1OyHPrWETeO81eBA62C0SR4TyqzrgXtDbpHxmV0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b38kYnU3dhW9+kMTJS4YgJovXpXFCxLsFUxZbAU40oOA4hAXu0a60/MM5eSBLhuujOBpPY2YtG3sdOtim23lVdYXXYN7IVRrJiUGogWIpyR1JeHUm12LOpUE5oF93f05FiBhEgbcDuhkFup9RgLGqcMoRU7++TLxe9NeBxivsfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCB/swC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHTiGbkW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCB/swC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHTiGbkW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A4CFMx3208268
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0sat6yICHICkgE0JqSoEwGNE+4X28jqFFHG
	EIdL35As=; b=PCB/swC1N7rRYttemsU8Gj9lU8GnJwnwH8qoReeQGhfnFCdHNj+
	hX8djLotiu9g1XoJwrbH9tS/eO92H88gteg8GHhX93yuUgnv2zJxiB7JPZmFBU1G
	RKGadyZEwTvRwWIuBYGssJpAGgL7BedQ5TuxI3apyjdY6kEffEc5yvWwfipuKAVN
	K7ccwOLFW7VTPW843Bw/Ays+peOvUpiU/fQRZZm5k2ltPhl6n9KoEO8NpsPUxCnJ
	Z4M1HZq6fZs9T2qRP2TokxFjDuGpUjmZj8zflehxUSsUMXd2ngTdtrXZTHbd7bmd
	TDae2ZomGQ2/99Ley10jJk0lkqEHNJud6Iw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4e84vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7695f6a30so458269a12.0
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 22:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791610384; x=1792215184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0sat6yICHICkgE0JqSoEwGNE+4X28jqFFHGEIdL35As=;
        b=UHTiGbkWM8r91ppy3nlHbLHwPbc6RfGjC48Xr/L6gCrT11AodBOz2SZqAStnOBHXaW
         Rr/19BMBYz5N/+ajomBAWTc10SamXW6JEWDP5OXlthc4rqtXj2KxIBJTz+n2+BE5fKKT
         +PRklpjg9efQoh7Rvo+UYWQBXkJxy8vi7qBlG84w1pJ5iiZzoEZnj0NzPbNVcF2eKhn2
         wL09QtNt1HcGriEBW5ZB9MX/GScavBh5squZAoZuhxrknRQoPP98w2mWaPIu2/FyWpLP
         hgTFRofDjkzmMB7xvZfCD8fXLpc5KWwiBvSTKHiQG6H4DWVuhUGeFwPYN5qXQJgQycWh
         tjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791610384; x=1792215184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0sat6yICHICkgE0JqSoEwGNE+4X28jqFFHGEIdL35As=;
        b=qE9Z/TFSz8m+CaFI36deziFzAHNFh9i9jkuT8/gSjCyfZ7Py3Ukq36hRW+FHKZO4WX
         M81Un4FFGpO/ynpxV4HMeNVHgHdlobaXq1jqsIvUAOWpkcgF5giwJklCrxGV56sMkkxz
         yAUxdc+velbS65/EvHwfJ4OdLZ3Of+9RcZyTyh39M2vqfHttW1B3Gz9tMSqP+5ZqTew2
         LMgg/Iz+v2/GLc7xZuzZRRV1XPS9NDoIjIglEVdrZwEfgqogCr10C8NmZdH5V4W7LlhX
         uxx0Je5Qu48w0Ayyto4uuV2Hu9NGNq6S4JY+IIkMcY7jOXwgtRsk92ePtQpND9P4JImM
         zv8A==
X-Forwarded-Encrypted: i=1; AKwUvBweKmk6AZhOUc8oCmwuo6NZXGhx1RowsyxOu/uZw1Nca/Jx8Wol1LBnPx4Q0DrBb6rQweFZbVYa18s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrsBdtBBo8sgi//2nvmdlgAUqdN5IzXWQj+p/EwnYAPTG1tONX
	ZD/7kPBm/OnW1ujiVxI+4jzeO9D3YO4N7tgWsGqWHubxpBIU3KQ/RWbD8eBiPn9ruyv+u2A2bj1
	nPCJrjGhZSkeXpAWYhcIwIzqu0C74rbxZIye/wjX5VBx7pPC4uNXj9ZdD1HqUK0k=
X-Gm-Gg: AYBFou1K0iXs/6Dx9mc9kQFkAgA7wByJdbRm25eK4mHE2DvVZ6SdAcG2IXaqfbgw0Lz
	KJdS3blb3aqhhUTEqZH/OPzBew7/Hhk9NDpzn905SCFILIB1A/rLpt1NBQxlPg64uZ8HTUXF4fX
	XuflzfHO6dbQH9snmDa1KP+wMLXJ1XRmH1K/JqgOR2NEKGwnZWO0uMfUkso8S7PaA44I8pxeVYx
	MHlXmcK2hqc5oXvF+i77TkfEaKKk910TCtv2GgGhxR4fjOjskP5NLlrJsgnlJ+CWB6NtW1paAPt
	0IMpj0APDsgAK/1HxqUKKbEs+sliyh/CMXh/ubGbgtlCpBH16t0KU/JDIR3srlcyebabSBcphQu
	PzAMNhMPs0b66UnzUq1Z28C28CUThJ3Q=
X-Received: by 2002:a05:6a00:1887:b0:888:add:a74c with SMTP id d2e1a72fcca58-897c49b2675mr3487786b3a.4.1791610383886;
        Fri, 09 Oct 2026 22:33:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:1887:b0:888:add:a74c with SMTP id d2e1a72fcca58-897c49b2675mr3487773b3a.4.1791610383111;
        Fri, 09 Oct 2026 22:33:03 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm174028b3a.61.2026.10.09.22.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 22:33:02 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com
Cc: sriram.dash@oss.qualcomm.com, jack.pham@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, shazad.hussain@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v3 0/7] usb: dwc3: qcom: Add firmware-managed resource support for SA8255P
Date: Sat, 10 Oct 2026 11:02:39 +0530
Message-Id: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfXyWZXIcmNZedJ
 bylhWgo5xEDuM4Q9+1kZ2o22l2JragyLtQkHRPy4RGiNrWYoZgv8dPcj22tXwRbWYl7jgrhJd6k
 wFFZXnv0hTcIMMEmaBeJNU7ZX87hEeYg9kIkZkDv4N+Dvjm023LOCZH75UWARu7eHP39JC3oasS
 tckwHgXBkFUblMCkBQAva9tnrFc0pnKt0QIu4amVDLw2Gcvg5OMy9Vp4POrEtFRFST2+908cLXO
 DTwdaYAHz8vFHyoY+V18CQIVN3MRv/xWmjZrVhyXen77Vu3lHxggW3a1ycfrnWhmjSM8G1T5MHO
 dTBIQcf2/Im+UszThqh21EGjHHy/Cico3yPBSmW4d3mXEzIzqETASBrNz0GShN5YtTZUqb3UUMD
 aCuixFqjGekR4ARDZn2CTrqjtbuAlduV9ny6YhnT8F+N+qeQTlorE83fbGvO6MvaIwXGtw65o0p
 6HKZ2aLnQjANGc2Dhkw==
X-Proofpoint-ORIG-GUID: mu6YuunEXng-XO1LkRdTcxeSNoVADMwV
X-Proofpoint-GUID: mu6YuunEXng-XO1LkRdTcxeSNoVADMwV
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6ac9ce10 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5r66-90xSKbixmntD4YA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX/n46gRlu87gi
 EwK9rJGBmJCGQAfywAqWgTsHlACUIqEUKB9zojm65lzZEQP/xjee0SE+6WxhkcF8/WH8xdXmr2t
 qCsiDI7n+JQy19qPI0sK2Z3TTK1t6xg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100021

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
           "power"/"bus" power-domains and excluding clocks/
           interconnects for firmware-managed platforms.
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

 .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 119 +++++
 drivers/usb/dwc3/core.c                       |   3 +
 drivers/usb/dwc3/core.h                       |   3 +
 drivers/usb/dwc3/dwc3-qcom.c                  | 411 +++++++++++++++---
 drivers/usb/dwc3/glue.h                       |   2 +
 drivers/usb/dwc3/host.c                       |   5 +-
 drivers/usb/host/xhci-plat.c                  |   3 +
 7 files changed, 487 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml

-- 
2.34.1

