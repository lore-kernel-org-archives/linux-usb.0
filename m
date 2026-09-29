Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9470337A857
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 05:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659176; cv=none; b=AWS8XUwnodshR0kukSNQ5SMyE722sZx4OywhZOoMp+uvWZH6bR1FS6P6Moeg5Vluxtre4dhIbl9cmkUCEV7e9slc2S9u0OPZ9LEft+BotvUS+j4p/vDzBF308ho/7LjCPwArc+3oZruz95iIMaTJZPLPvQ8UT93+1+L7EPLF4QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659176; c=relaxed/simple;
	bh=qkNSfRBuIy53rg4Nn/2TkVfGkD/nlXMY/pVq5xmNMyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pD0QkrKuJvegYk76ufiDmH4DMrJLAhZhpXAzcQrfkOyLhuk7D5BL1/c2LXkZD580cvPQEhZWYyVxhJETthPos2cAzcVQm9/vWcS0D/nrq8AYeqgQqkra+oWt8uygD61Z5w+xGOydaysUvBbXOAJ1oMrrYMOjQSXmX1jfAQOEb4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nz2DaIkp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jlOGU3OE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nz2DaIkp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jlOGU3OE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47MPp3643749
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 05:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=84I6dwv8lrYLFqtHCg9mwt
	ZCKKguwH+d2StAc1aezx8=; b=nz2DaIkpwgitSY08sT6npAwlQaRrbAKkQRZ6Ky
	yPn5FOxcderKhQhgV0Y0ZI9XccSrCuEJ1AUfQfc5/SkmRIgAV31O521toQoAOYXN
	KBv4wRE27maghjyAGsU9RjL7wF2ekoR+TM6rV9XB5ZPI9x5gIt4Ev2gn75FIYZBX
	9zRGWZOcdfMTTENF5nNb2m4KW6jnygk7t+mtvQTJfiGt1ELqSSgOqqaF8y6nVhVk
	ztshNRRblNBnqAzH8ty/1Tr2/oV4sdm+8Y4TAVjYOfLIJKrzx7+xZ6f97Rz11aFQ
	pjMV7rox+8LBDnOmSdph8DLyQDVU8iPEn9MQglz4JGYw1cOg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4s9ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 05:19:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so5450523eec.0
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 22:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790659173; x=1791263973; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=84I6dwv8lrYLFqtHCg9mwtZCKKguwH+d2StAc1aezx8=;
        b=jlOGU3OEaKeAlIKN6bATJWpgsnD4d8DlG9Rd2P2q/1wabrzSGVann3tIL+hcBe0RvY
         M+MRLlxm+YvllI6e/fFpEEhAh6ZighbWJJ1WWK4SHbQBQAV8235WV+U63xgFGMiOhGgK
         V1LfL7I7tNT47QcRwe80qTd4PE8ldf1ESItSgdGaGjudcfw0FyD/sUgqBdvM3J2Z0Xvo
         cEDq3UFsXFi/QEzIiIbTQoDs054kPmR1Y7otuChGkDbzMyPN82ZapNQdiPjhwNrAG4c4
         VCY/Dwx8sQXOv8ytu5U2jYBGS9MEnvJ7tw9A8oaso98jgwry/9ffqjY5yLnwymNRmusg
         aqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790659173; x=1791263973;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=84I6dwv8lrYLFqtHCg9mwtZCKKguwH+d2StAc1aezx8=;
        b=PCA2be5GuR6GLlKQn30LAd4m6bw2YX95n5VPQ+MiZv0xl28EL/DVbg7jQcvy3RKTU9
         Bj2YxrgYLUwF/tIAi0+zzUlsj07xeSa702EzKgXDyUfmyIH+AhWd8HgDyG6uJ2BJ5o78
         883ZCFk9203j31SYmszvk4GEkuSETe7/AWzp5K9ETqJYO5WBxPvYwCwaQJiQlOhe7vf1
         ub0s5IXAjA7pbDvhpSWjIKBndQrMUoJbhjMmIWcGM39ZqVPF7g2ywHgdnLZUr1JxoMnD
         /fVKRGG7Vfp0diDkFkr/CuvtMzwoDbHbMJ0EL1SDYhzljWYrEypgSNMFJhkrclGMxcWZ
         BUrA==
X-Gm-Message-State: AFuF++kKt69C5+Yuntrzgu3023GWv13PslQpNt7/vh2IZVhsDaEYfgnR
	yJoWWGZKixO+5RT7jAEfEfngNFxLpRiwEUyjg8pWuC/+jZa/jDbcp/cUTUvIJx9qMI22w6a3rKc
	wBSx2KT3rQzUyjp4zINSW2v2NI7EfhRzzb47wPnY/jMQ5cHeAN/GpSpAdPSkgQ18F01cepUo=
X-Gm-Gg: AYBFou3seCNkYgt5W7y3UJUA7s4/t2dR9C3cWnXhrbzk1jlUwY9cHJfS5EOoJvWj0H6
	tUUprrYRlUxVXbDz2ZEV9QgdzHOUeyX4BbE4Y1PXrxYT5+xRwmzbQ3mr9zma18Pg+XVujTJ1dEv
	kXSKUSYzsXgP/ehBP9mqyau9KRZSHtkRdOLOOrY07/uy0jSgqKiP6EMrPIzl+qz2w3Z1plKtbFD
	SmvqDgXAEARVed4EgZ99FyERTl/t9unWTwpFeM46ZR+zBbLgXF518J0Dqr12//NzZVZyBUOEzpi
	mC1U0PNYAG4CwON2scSKTj+kJjbFp+nOnAu/msbykm83N7YHiT+X2PWtJzRhavffZ94vaveFqie
	eZOXCgztzgS+Cn1uSp7jPLYYnJiD/HhxfcZ5/Bh6eY2zKAPhe7UgduLMMBKGwlrMC+vjh
X-Received: by 2002:a05:7301:687:b0:33e:64bb:e5d1 with SMTP id 5a478bee46e88-3427265e212mr19203291eec.34.1790659172616;
        Mon, 28 Sep 2026 22:19:32 -0700 (PDT)
X-Received: by 2002:a05:7301:687:b0:33e:64bb:e5d1 with SMTP id 5a478bee46e88-3427265e212mr19203255eec.34.1790659171975;
        Mon, 28 Sep 2026 22:19:31 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3434958c3adsm42688896eec.22.2026.09.28.22.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:19:31 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 10:49:25 +0530
Subject: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck during
 enumeration
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFxKu2oC/yXMQQoCMQxA0asMWRuorYj1KuKijalGsUrSGQaGu
 btVl2/x/wLGKmxwHBZQnsTkVTvCZgC6pXpllEs3eOf3LvqImp4otbGWRIzWRnrgFDCl4miXtyH
 HA/T4rVxk/o1P579tzHem9r3Bun4AiZBKKHoAAAA=
X-Change-ID: 20260929-ram-interface-stuck-v3-aaf0c4b13b98
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790659168; l=6212;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=qkNSfRBuIy53rg4Nn/2TkVfGkD/nlXMY/pVq5xmNMyE=;
 b=L4WJYqCwzH/M5D/HF37YAtJYWWThk1yMow7Qr61G3w6ebJdIW0ldg0COajDsl3/tbABzIfYaL
 J6fRm9LLad9CL3+Vk1I9ZMb+FxibcyVhdMb5aZEat2DTcHRSu4G1lCN
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMSBTYWx0ZWRfX5Fc0XmW5D8q+
 +CG8og3fXXMoFTWorv2KY/pjhCrHdfu09joGa/yxvVI9an2k+1ScM+CpSz4dO4HHePO6BpMgpTn
 vUrYH7+EJhDEzslpuR1oKWYYZ9n70bg=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb4a65 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8
 a=Ps5XhnICjWHbJgl_nW8A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMSBTYWx0ZWRfX3vfkC2iF880I
 /RCzULHe/YHneQkw1Tk50h1oT5k565oBGXBd8SnW1yCeSjEvTKyYUpQE9SkSrI8BLHmb1dLOn/O
 H0xpyS3g6J1LU8RUWzOAikQjS4hOLLBLUfpcnhyxbqPFyF1JoM40Gs5pR7gaQEhxG9Z+w4UTSkD
 QbzuABdLJN5FEmjeyz2oB6xwnUVBc2pcW9XtSP9D5V/NLPjyDhrbM+i1xAITGyMWZPjXm4mEB7p
 2L0wC5Us6wAV/8PAE3XX0C/WdtQh2WYa/9YiWohPQYwrptEZRw+R+08FWgx3HNpzKFLIOwr/edn
 6HjbVX4Ut/zdq7AcMmBMPlDntWvj5efPhtl1gPdqtvLJXg2C8WlCURqL7SqaJw4C8ZlnmqR02Kn
 ua+vVeNKgzZx/Pp6golAQMRLdOQFByvOzsTMOnluOJZb2IO+SYG0yoYuLWqW02RbaL+X5X7+II3
 LyIgwP2HCs57HjaLffw==
X-Proofpoint-GUID: 9-OaWRQy2i10gg-UcuJTidc6zT6r1oEt
X-Proofpoint-ORIG-GUID: 9-OaWRQy2i10gg-UcuJTidc6zT6r1oEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290021

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

Also, didn't add locking while calling error recovery work in
gadget_ep_cmd since the caller is supposed to handle it.

Changes to v3:
- Using error receovery mechanism from [1].

Link to v2:
https://lore.kernel.org/all/20260806-ram-interface-code-v2-1-fe4a0de31d42@oss.qualcomm.com/

Changes in v2:
- Implemented gadget recovery mechanism during gadget_ep_cmd instead of
handling this issue only during disconnect.

Link to RFC:
https://lore.kernel.org/all/20231011100214.25720-1-quic_kriskura@quicinc.com/

[1]: https://lore.kernel.org/all/20260915110637.17658-1-jiazi.liu1984@gmail.com/
---
 drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index ee837235630a..a7c4514cf0e2 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -283,6 +283,8 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
 	return ret;
 }
 
+static void dwc3_schedule_err_recovery(struct dwc3 *dwc);
+
 /**
  * dwc3_send_gadget_ep_cmd - issue an endpoint command
  * @dep: the endpoint to which the command is going to be issued
@@ -432,6 +434,23 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
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
+		dwc3_schedule_err_recovery(dwc);
+
 skip_status:
 	trace_dwc3_gadget_ep_cmd(dep, cmd, params, cmd_status);
 

---
base-commit: ab29ca7714b82485ebb31d66835ccd5364221a76
change-id: 20260929-ram-interface-stuck-v3-aaf0c4b13b98

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

