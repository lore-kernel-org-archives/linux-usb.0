Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC531F983
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 05:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995382; cv=none; b=Tb0gkAKDesFPCoOME7OoRvUW83yJvVDj3HmzsxvAmHKyo4TmEm8xi4VKDuvVycyPji2wo2jETXXco3Bg9IwLB7YYSeFdhvxEVUjNPFtyDlN7Axu2pBcWUXO0f28KOtQxorn9Ld6BBgf+KPTVfc85hlcNjysfxp+6V5S2iLo6nCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995382; c=relaxed/simple;
	bh=fqunP5SfTFTovELOSQ+WUS0VCQps8l2Lq15RqznpILA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tZP0xOE2HPj/BiLo36vxV6MfAKzQFks0t3sOE1hYqxgRNRYRQwOQALSmumX9572gJzaWgMwdx+Urt/TlJbDfT7avMfhZ/P8c79Kqj2DOdBnHdUpml7NZyo5cv9+3KeAXadHbIUY4HkgbNh6QGOurk0RoJGyllxBLVfpds4X+sxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aF/DjnuU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDNxHDzb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aF/DjnuU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDNxHDzb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763x1eY482620
	for <linux-usb@vger.kernel.org>; Thu, 6 Aug 2026 05:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a6DywMUfU4KkfqH+PmH/ZJ
	Q5JylNzHYkM3sIOdMPX6s=; b=aF/DjnuUO2knuD0W5J6hQQiQ5cwwLT67EFxPon
	gUtcooQK+0r5auS5rEUXQMaJgOe4nZW/TeO/fh6czenJdIYuOCG5MEVOi2Mx463L
	2YGSwZTRb4eEL0lBfDxJCMq4e90vhtETrBHxTm1GJ56iCcRdBec7KpabTACVym4e
	BP6o+TgugvQVOWIVnLGM7w+fCMaS1JVsiva1YEoNPyCcz62dRMn6/ykx5wJWcw1C
	2SkOmgqLrZT4V/yTH7KKKpQV/AKiDAk6DZ67E7wm4edqXbHc66FsOhqzMmQ+BZYG
	cfjUHs1Gl7NxY915LRXVchaGH4MTpO7gJtYHvmkcn2fCoJew==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuegb3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 05:49:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so17191855ad.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 22:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785995379; x=1786600179; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a6DywMUfU4KkfqH+PmH/ZJQ5JylNzHYkM3sIOdMPX6s=;
        b=SDNxHDzbwuhIWFd5eNBJuN2Y/wrdqJISXyHbg0ubH7dHPx7fyDJk8Cl85HzlphSjzH
         WS+5bGRpSa4G7wIEqWdivNoyfK//ur9vLToml2xP4kVDhhKhkihDS7KI1VZ8BN9zEYOn
         bWyw+1U5U3DAow5vrfanINCQIFrIYN73aB5B45W/NjtzMNB4I3ZuS6/5+Rul2FTC7U9W
         JtZmWHFqak87a2eUu7CksDue0G05f3PwYdmfMVcn2e6RcP4txycweRVa/qk+eYdNHMJ2
         eV0aZVgIF8ftqisK+yy6GAje63R++Glp9SQziF3lGdf7wEMhjjBUIBgHHwXPvCdixRet
         Pv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785995379; x=1786600179;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a6DywMUfU4KkfqH+PmH/ZJQ5JylNzHYkM3sIOdMPX6s=;
        b=EGUsiAUPRGiJThdRDHGVNxaPIt/+Tv8NwwNCYZ+Ze9iBUQZBb88d9zHfLNPbg3qNne
         QAlGjQ9A3sBuBmBzhi5VGHDp5+WiEm/atsxF5TUs4J/VN89J7TyKZiX9QvW7khZr7m/L
         z5Unq+yqg1ROVAYDcEh3/XCCXC3M/UZgNM6JisZ/ld+VIC6BD3kcMHCGRs19ej0o+PSQ
         k60+51ZLdmfIVSSe3E/m/FoXShOmQLzxciN65d2aUiBsF7j2NX5GeQSYE37vTlWFdXDx
         UMwf7qD6G5xHtIWN4ENZ0XnmLZjqzzmrWJmYUDT2u4S+kQUTSgNpRCaqDiAJc2h/khuS
         8TjQ==
X-Gm-Message-State: AOJu0Yw75O+jstiIL/uXYfy8obGkI9XYa9qtVZtPu91V9mfl/Svvy/Up
	IiOXKuT+IMdBF9MqpL41lGTb3yiGbPuQ4YjUzkrglyz6ilRo+odkFUTMwATIWmlg+smw7r8xXJ6
	PN5OsSVYqW05Z1gW68KY54a0qQFAvFzqFbR4VCwdPvxHwvtDAtrT92QgRo6yuhfvo6lALabk=
X-Gm-Gg: AR+sD10+aq0VsT+200i+u7fxqJD7pBySJAMC3ierbot0qNOl3uESI3Q0e6BIoSx839X
	K256FV5tEoQv2fWTh0mk1cnDy7hcwLtZpeJ64Nckec7UZATPFCaXLuoTsOFXUmwvD3/1DVptSAe
	ye/aTr0VhuMqkFER2C8ryIbKgwLueUEguebb5RmC7z2AGspqhJ1EfP8TD7AaHhcj+TfQ8ig06cT
	9hLjU3t/ldsoY5Ih5xOxtWpHQ3lPhy3AbWkr8LQ0pZQDWgu2MbGfJMq6K0XMhLAQuD6ZjZmC4WU
	lG862pjAdlHb6rvzjP+JBDShMHtDMCMuIbDCAvBAJU4UCsxbou/mJVSkFMliYoIR61D2JjwL7KG
	j6EVarCPYBfPTuusDusRf3fHZFwKTsJhsDwqvK8w43my0dE49YwSLbrTvgQkcz2lc32q+JQ==
X-Received: by 2002:a17:902:f548:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2d0ca97f440mr125391625ad.20.1785995378836;
        Wed, 05 Aug 2026 22:49:38 -0700 (PDT)
X-Received: by 2002:a17:902:f548:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2d0ca97f440mr125391295ad.20.1785995378339;
        Wed, 05 Aug 2026 22:49:38 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d67dcsm25220995ad.70.2026.08.05.22.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:49:37 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 11:19:28 +0530
Subject: [PATCH v2] usb: dwc3: core: Fix RAM interface getting stuck during
 enumeration
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-ram-interface-code-v2-1-fe4a0de31d42@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGcgdGoC/yXMQQ6CQAxG4auQrm0yFgPqVQyLofxoTRxMBw0J4
 e6OuvwW762U4YZM52olx9uyTalAdhXpLaYr2IZikiBNOIaaPT7Y0gwfo4J1GsB70UYObTi1tVA
 Jn47Rlt/00v2dX/0dOn9PtG0fv8zQbnYAAAA=
X-Change-ID: 20260803-ram-interface-code-12c624709732
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785995376; l=6113;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=fqunP5SfTFTovELOSQ+WUS0VCQps8l2Lq15RqznpILA=;
 b=UoGt4CKEWe8j6iAiY/CNyWtYM+U3MsU4M1foLH5EjV2NrkS12ZmCz6pRT4O6zCJQABp5AD2sZ
 7zNSn0z0c9EDmvok+LfNXfd6eo6l+fOaznhysC4Vl1Tv2abtOQBrglj
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a742073 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=94xMQWBFbH3JTKwHvuYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _362j5uUy11i_svxdpy2TpMVEpcOSCvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA0MiBTYWx0ZWRfX0zXO/g+fIAt2
 HQXxeCh6p6MTruI4u0lOw6AD/cLiISorJJOTHVESSHp9mFjiHSiTa8Xtq5WnlesYoJn+7klRc6G
 FWKAcdvH8qo15hZcwq0up+h3+VDKeeITMkmAOfg8QvZbhSdyryf7JO7+Uoag+FgddDNG2CJrYWS
 knozdEtQaCJ0WFCHEseVU2nVgpyOqXqdxTY1ITDafyUPpVzuqgUYRmTJFOgnUrof5w2rzbbPJsP
 s2WpNpcWmMlFlcEBqcHhHABI7KOTuuW+6uFUisPYlwhGKF5xybc5JyhjyTQW7IaQDCYp578FS9W
 s+ANwK5PyZC0GehGhDshx5t/I18By5hOFcze4foWCjBICgWz181vppnEFGEmcBgDCqpqH01bbu4
 gnjEBQtOoHz76LQGk707CaQ0SxYqvK1pjmB0qF2aJAOb5us+999nh2zki9bSZlQA5l311To6+r6
 wL9fMIsrktBiUMYlreA==
X-Proofpoint-ORIG-GUID: _362j5uUy11i_svxdpy2TpMVEpcOSCvp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA0MiBTYWx0ZWRfX4KOPNs0Ui+50
 rC0YA30ZCwl7UaC3JeLG8dP50+shsHjA137mEDVALdkQJVZas32QTj4nOzwjitdz0i7lddVDZJD
 kqolKLQdgfDECyQhoU198L1c5wnSbL4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060042

During plug-in/plug-out test cases, it is sometimes seen that no events
are generated by the controller and all CSR register reads give "0" and
CSR_Timeout bit gets set indicating that CSR reads/writes are timing out
or timed out.

The issue comes up on different instnaces of enumeration on different
platforms. On SM8550, the debug log is as follows:

Prepared a TRB on ep0out and did start transfer to get set
address request from host:

<...>-7191    [000] D..1.    66.421006: dwc3_gadget_ep_cmd: ep0out:
cmd 'Start Transfer' [406] params 00000000 efffa000 00000000 -->
status: Successful

<...>-7191    [000] D..1.    66.421196: dwc3_event: event (0000c040):
ep0out: Transfer Complete (sIL) [Setup Phase]

<...>-7191    [000] D..1.    66.421197: dwc3_ctrl_req: Set
Address(Addr = 01)

An XFER NRDY is received on ep0in for zero length status phase and
a Start Transfer was done on ep0in with 0-length packet in 2 Stage
status phase:

<...>-7191    [000] D..1.    66.421249: dwc3_event: event (000020c2):
ep0in: Transfer Not Ready [00000000] (Not Active) [Status Phase]

<...>-7191    [000] D..1.    66.421266: dwc3_prepare_trb: ep0in: trb
ffffffc00fcfd000 (E0:D0) buf 00000000efffa000 size 0 ctrl 00000c33
sofn 00000000 (HLcs:SC:status2)

<...>-7191    [000] D..1.    66.421387: dwc3_gadget_ep_cmd: ep0in: cmd
'Start Transfer' [406] params 00000000 efffa000 00000000 -->status:
Successful

A bus reset was then received directly after 500 msec. Software never
got the cmd complete for the start transfer done in status phase. Here
the RAM interface is stuck. So host issues a bus reset as link is
idle for 500 msec:

<...>-7191    [000] D..1.    66.935603: dwc3_event: event (00000101):
Reset [U0]

Then software sees that it is in status phase and we issue an ENDXFER
on ep0in and it gets timedout waiting for the CMDACT to go '0':

<...>-7191    [000] D..1.    66.958249: dwc3_gadget_ep_cmd: ep0in: cmd
'End Transfer' [10508] params 00000000 00000000 00000000 --> status:
Timed Out

Upon debug with Synopsys, the root cause is as follows:

During any transfer, if the data is not successfully transmitted,
then a Done (with failure) handshake is returned, so that the BMU
can re-attempt the same data again by rewinding its data pointers.

But, if the USB IN is a 0-length payload (which is what is happening
in this case - 2 stage status phase of set_address), then there is no
need to rewind the pointers and the Done (with failure) handshake is
not returned for failure case. This keeps the Request-Done interface
busy till the next Done handshake. The MAC sends the 0-length payload
again when the host requests. If the transmission is successful this
time, the Done (with success) handshake is provided back. Otherwise,
it repeats the same steps again.

If the cable is disconnected or if the Host aborts the transfer on 3
consecutive failed attempts, the Request-Done handshake is not
complete. This keeps the interface busy.

The subsequent RAM access cannot proceed until the above pending
transfer is complete. This results in failure of any access to RAM
address locations. Many of the EndPoint commands need to access the
RAM and they would fail to complete successfully.

Furthermore when cable removal happens, this would not generate a
disconnect event and the "connected" flag remains true always blockin
suspend.

Synopsys confirmed that the issue is present on all USB3 devices and
as a workaround, suggested to re-initialize device mode.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
This series has only been compile tested. The issue was reproduced
easily with a certain kind of cable and CDP port of AMD based Lenovo
laptop. I don't have access to the cable currently and hence only
compile testing the fix for now. But the issue has popped up on OEM
testing as well.

Changes in v2:
- Implemented gadget recovery mechanism during gadget_ep_cmd instead of
handling this issue only during disconnect.

Link to RFC:
https://lore.kernel.org/all/20231011100214.25720-1-quic_kriskura@quicinc.com/
---
 drivers/usb/dwc3/gadget.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index fa0f16ffafef..7aa290a804cc 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -283,6 +283,17 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
 	return ret;
 }
 
+static int dwc3_gadget_soft_disconnect(struct dwc3 *dwc);
+static int dwc3_gadget_soft_connect(struct dwc3 *dwc);
+
+static void dwc3_gadget_recover(struct dwc3 *dwc)
+{
+	dev_warn(dwc->dev, "controller dead... triggering soft reconnect\n");
+	dwc3_gadget_soft_disconnect(dwc);
+	udelay(100);
+	dwc3_gadget_soft_connect(dwc);
+}
+
 /**
  * dwc3_send_gadget_ep_cmd - issue an endpoint command
  * @dep: the endpoint to which the command is going to be issued
@@ -432,6 +443,23 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 		cmd_status = -ETIMEDOUT;
 	}
 
+	/*
+	 * STAR 5001544 - In some situations, like the cable is
+	 * disconnected or if the Host aborts the transfer on 3
+	 * consecutive failed attempts, the Request-Done handshake is not
+	 * complete. This keeps the RAM interface busy.
+	 *
+	 * The subsequent RAM access cannot proceed until the pending
+	 * transfer is complete. This results in failure of any access
+	 * to RAM address locations. Many of the EndPoint commands need to
+	 * access the RAM and they would fail to complete successfully.
+	 *
+	 * If the depcmd doesn't match the actual command, trigger controller
+	 * recovery.
+	 */
+	if (DWC3_DEPCMD_CMD(reg) != DWC3_DEPCMD_CMD(cmd))
+		dwc3_gadget_recover(dwc);
+
 skip_status:
 	trace_dwc3_gadget_ep_cmd(dep, cmd, params, cmd_status);
 

---
base-commit: 5d5fd841c34649f1b09220fe58e59dffd61c447d
change-id: 20260803-ram-interface-code-12c624709732

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

