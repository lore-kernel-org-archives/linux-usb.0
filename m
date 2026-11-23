Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452187;
	b=RVMpI/BtIgxcS6Yr0Rok41nDl87JpgfnSLruBKNildjmX5FKR2VlazUlxUeLJLD0AB5j
	 W3szG8iVNL5p56t1T/K4WF7m9QuWzmJ5gSM642p4sDY+Nz40vl6TTB16ZhM6W2Y3mnyMp
	 +m1BfyC0vNXTAGRO1pJScpbDStD3PShnPY5lqCJzhxiyYiqKOxP3EbtWoAnisa0Lifoba
	 jnCxkUB9FLwDb2AWpyuxl2tVxuSLlIU6NoJEoRDvS4tASe56v8/qy8mi3ShFYX+V7ykVc
	 qpTnDpBL+MfTGmcdeiwLvjJDyeNIcS+POr4VpVbbJt7iJ2eXqILccb4EAfR1Nqy4lnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fcVhwGNGEDbkrG268cH/it3jO0ipQUHOtEv4oZrCYV4=;
	b=mHUHJDUhfr8giLiUxnMvuUHR7Ph1Bdp2S4bf5ENoAzytWntuuvv1rsd3CPcLUYtVeZMo
	 zgLXbqQLTbbe9ufhVwECzJjhrUHa14o4t/ax3Iuu0LnRrmfrzm01GfFt+D4F6mYd4h3Ob
	 YED8/XzLTqjq8Ax4TcMzTcVnxFuwWrEQCy3QhFjMMfaftpjbEs0b/sXITkhJJ99Kyhqah
	 u0RBiPCQt/XUw38Mt9FNqtdkMZRHr0HhH1Bvy2QwI9Rkw/+XtiyfIomLL+fpnUnz80Qzu
	 eWceTNzFD1aioTEWZYToICsMiSo06WijjKsplO4T8R27O4Z28JIAk7vluHa33Cx/xRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Afw4t7Mt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Sm96VJn/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8C5606A31F
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD8C5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Afw4t7Mt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sm96VJn/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGl613025316
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fcVhwGNGEDbkrG268cH/it
	3jO0ipQUHOtEv4oZrCYV4=; b=Afw4t7MtUxa8Qov8eQ9L4lq6ezGyeUEseouspj
	krKMoXo2mrkY02EZSRjF+izliAY780yCyRH36uh2EVmpsJeV6mj3pytdZauHJJDU
	Nebz99labw2OJyLP6EDodcPyW7AQNcrBI6ofWN4nJcrGjtrxPixG0NaAC8rE1a4f
	bWSQew5VN7VLftqq3G8vHqBIJb6/2OfihSvzH/h62Igi+qUPXOr5JRpjW6gnYOvV
	W1ZOXqeuqJSJlzgqhUWt1m52rBZexVfJ50z+KGtzKlrcc0bcen9qtc5ocVKLjgrU
	9oFKos1FiZ2rx7invxBODdkjbZOivYNd9hikFhhMfmJvQnXQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pae3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:05 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece7e4af28so2596190e0c.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 08:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452185; x=1796056985; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fcVhwGNGEDbkrG268cH/it3jO0ipQUHOtEv4oZrCYV4=;
        b=Sm96VJn/nS+ftEAnyeCEog/FvM6PZfILG9EsQM7bxQZocl9X8nahBAKcDndiLKNyTo
         S+d+fZRfHmB4SjLik+4vjD7i3MRNTwR4b1Qu3+w1mwoaXPEwjjudKb/do4znB/qh9C0p
         ES2BmpGBcPARpyxgO1dSIRK70qiX8i7zWev34vIrZdWygUrn0Z8KawBWlO9qQL+AaCLC
         vU9LTjVSN4oQhJRQKgGmHyA4/pFuogJM2l+LbcSDLhEaPo8EQ214txqJg77opfQwrUE5
         cdtno9lcM3eNo+lpEIqC8jB8r6OnOT/GkY/kxHvbQOODsuLmJ9fgbcHPBkq4nU7CFrJ8
         +xmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452185; x=1796056985;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fcVhwGNGEDbkrG268cH/it3jO0ipQUHOtEv4oZrCYV4=;
        b=zlwtuaESUDjT1DxNcMfpiHG0bxyyp2yanWv6bSKG2tlHA8gg+GCLcU7GdInKYmYdLz
         qRmQbzllrJfXPgWQ7q28BZvElwG08X436yGvKLXISFHQTpeGmVxxhWwZCoxNBLWFKA3c
         1hitqlJqDC+PTIyEU4EfoeRE/gpANH3vLcH/ZKzRV4hSALraVOx72Uks/DJU4v1QMYxi
         vUQim2bQai63TCQ6F5leOdiLw9Iw1cfU07F4wmcgGR5ftyHwVEV0VoVBESF3KNPPpU1T
         +rQBkrr53gxU+WonuBec+6dG72fmmXUslgtGTRPVa8Ldimrmx6WTXaztmcs+FnR3Pzqq
         iN7Q==
X-Forwarded-Encrypted: i=1; AL+hErEpxDp3LgcNXCcejgEJFAjjDTE4B7OXxuV8+kOdTn9T4JodV76ZxmawrnqV6JP2EIlpRa/jpc0CTRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z83a9Molc6j/Rtps0YYlmZ8pWg1NRrbKwfOP78KszYSLSluWU8O
	qN/Vy70Fq9U5mCK04yxJmLGHHEcsVshV6lMH+bP9cTpxuGBOsgWvj80BpNfvtRPX0eCw84LQmQt
	saI9xy+Vc7zNLWFM5qkis6sRzGH7AgGPedlcdYry/Pg2rt/KeKNxiKVIz5pmNXWs=
X-Gm-Gg: AZFdTZdgeHy7GkNXDu826jcjHHoYcy8jXaqR5xz3E/lV/XLooOXPqDETixU8BDygBoq
	DfqsKh9dVjMliPKX9v+4N0ERUCajw0nEEKwo2BDov9CD4ZtyszSs7Hgv8ITANDmRC0GADI4f9u+
	lMY5buWNToxytqFHQgpeBVUJiyj7/yKXAwsAjzhENMo5hf8OTPLTNli6z50XyQ0kh4SJrprRP6j
	hasv02VJaoFWTpIxHuyAmbtWGQtjvioz5Ui33prQE7wkUQC2WxtV5R6iNwIkoIYgD6WmMm5x0qP
	LbJA7q9l++MGcWzAX21oG71A7eiTfXKOWquDRPUm/bmSqSSFrwBAdSSMiSFbQRlN7/mA4WvkuYf
	veDoa0RJWgx0XvhEGLRcTS1CGtlZGuHDoGEDE56gzT8xRdUAmnaoFsTwhnfET5qpfJHaBwtVaK9
	H593wQb5f/RSLs
X-Received: by 2002:a05:6122:e14c:b0:5ea:c37b:450 with SMTP id 71dfb90a1353d-5ee8af9e1e0mr6465997e0c.20.1795452184772;
        Mon, 23 Nov 2026 08:43:04 -0800 (PST)
X-Received: by 2002:a05:6122:e14c:b0:5ea:c37b:450 with SMTP id 71dfb90a1353d-5ee8af9e1e0mr6465964e0c.20.1795452184261;
        Mon, 23 Nov 2026 08:43:04 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:03 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: qcom: QCM2290: add the Embedded USB Debugger
Date: Mon, 23 Nov 2026 17:42:55 +0100
Message-Id: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MQQ6CMBBFr0JmbUmnCEVX3sOwKDDIJJZCK0RDe
 ncrazc/eT95b4dAninANdvB08aB3ZRAnTLoRjM9SHCfGJRUFSKexdJZpS5S0NqLGgnlUJiaygG
 SMXsa+H3U7k3ikcPL+c8R3/D3/u9sKKRoKyx1W6MutL65EPJlNc/OWZungSbG+AW6blr5rQAAA
 A==
X-Change-ID: 20261114-qcm2290-eud-81e10f3a8e5f
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ixY587aVOTaNXJfeXpcwaShkjkIlaqJo
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b046d19 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=b45o4kL6AAAA:8 a=dAV_Tri6AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ibbWKvYsyCdnmY7Y1RYA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
 a=dhdsR-PFWuPJUldTnwXm:22 a=jmfqb_Px-22hg6zlGo4Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfXwNGwnOgPh1Yx
 RfzTu5c11Bo/ED4DhkV3ggD4nWpdecW31Idjmcv3Z9fPzxk0v6Q0Cq0yerjvZxAQG3dFvSEEo1Y
 JJk73UTWgmnvs4BHyw5zPcvnDHRGsX8=
X-Proofpoint-ORIG-GUID: ixY587aVOTaNXJfeXpcwaShkjkIlaqJo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX3AlsxxWnSkFE
 JkdMzTcfwTG0diIk+n3srnaddSjbaYmTes4pM0F0Lxz4rStM9A6oH+uypYGx3A2PmMzz1Ox/gEJ
 4r6AZK8fJTo75MApHFJs2tbAn6IXAuM/n/QXydkBtoe3m+bml1X96KdJiKWZAT9WfbWs1dvKIYR
 zhyH+AweJ+jFMwZ67eKI7L882lTYXFnYqitZl2J6Gvn70GoVFfYD2A940fblzJkzJpkBdeQnAqo
 9V+aGavzptFj/ucV1HXBXgEkZjaZgQEKJ0p4HT+H1JLJBZjKXFGaYZ65Z9lnRks3qd/jyfnQcj/
 3KDCGRDeHLeA/HVQ3VaV1z8DrfJBpzLp1AVjB9lG/DKqiEnldF+RDUB4lQa3O1ccaiPMnmSLTMA
 Cc4eUqGiGXDt31N1Aij0S9qG2Ztn/ltOqRKsZTJl8W9tja3OpFoLSBhf5IIOdTR0Fo0hVTdS1nR
 LICrrunRW51WBkb0Iwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230066

The Embedded USB Debugger of the QCM2290 is the block the SC7280 has,
with one difference: its mode manager ignores the enable (EUD_EN2)
unless the TCSR register TCSR_APSS_SPARE_REG1 is set first. XBL_SEC,
the secure part of the boot loader, does exactly that when it enables
the EUD itself.

Why Linux sets the bit and not the firmware:

- XBL_SEC runs the sequence only when the device's debug policy (an
  optional signed image that enables JTAG) asks for it. Without one,
  as on the Arduino UNO Q, the board boots with both registers clear.
- The stock TEE (QTEE) does not set the bit either. It allow-lists
  TCSR_APSS_SPARE_REG1 for the HLOS secure IO calls next to EUD_EN2,
  with the same policy (write allowed when secure boot is off or debug
  is not disabled).
- TF-A does the same on Agatti [1][2]: TCSR_APSS_SPARE_REG1 is open to
  the normal world in all builds, EUD_EN2 in debug builds only.

So with either TEE only the driver can complete the sequence, while the
secure firmware keeps deciding whether the EUD may be enabled at all.
Where EUD_EN2 is refused, enabling fails with -EINVAL as before.

Arduino UNO Q (QRB2210) was used for testing, next-20261112 plus the board
support it needs and this series. The registers were read back through
qcom_scm_io_readl() with a debug patch.

TF-A built to allow EUD_EN2, three enable/disable cycles:

                 write   "enable"   TCSR   EUD_EN2      host enumerates
  enable         ok      1          1      0x01010101   05c6:9500, 05c6:9501
  disable        ok      0          0      0            nothing

TF-A release build, which refuses EUD_EN2:

                                    write     "enable"   TCSR afterwards
  enable, clear skipped (as in v1)    -EINVAL   0          1
  enable, this series                 -EINVAL   0          0

Stock QTEE + Gunyah (secure boot off), two fresh boots, two
enable/disable cycles each:

                 write   "enable"   host enumerates
  enable         ok      1          05c6:9500, 05c6:9501
  disable        ok      0          nothing

With v1 only the first enable per boot attached there; now every one
does.

OpenOCD master with its EUD adapter plus the SWD fixes in [3], TF-A
built to allow EUD_EN2: attaches over SWD (DPIDR 0x5ba02477), halts and
resumes cpu0. Without [3] the EUD's SWD function returns USB errors on
my host, with the kernel that worked in October as well, so this is not
related to the series.

Not tested: RB1.

dt_binding_check, dtbs_check (qrb2210-arduino-imola, qrb2210-rb1),
W=1 and checkpatch are clean.

Elson Serrao's pending EUD rework touches the same binding and driver;
this series does not depend on it, whichever lands second needs a small
rebase.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55733
[2] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55964
[3] https://review.openocd.org/q/topic:eud-swd-fixes

---
Changes in v2, all from the Sashiko review of v1:
- Binding, driver, dtsi: the TCSR register is no longer a third reg
  entry of the EUD node. It is a "qcom,tcsr-reg" phandle + offset to
  the TCSR syscon, which already covers it.
- Driver: clear the TCSR register again when EUD_EN2 is refused; it
  stayed set before.
- New patch 1: clear the enabled state on disable (existing bug).
- Link to v1: https://lore.kernel.org/r/20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com

---
Igor Opaniuk (5):
      usb: misc: qcom_eud: clear the enabled state on disable
      dt-bindings: soc: qcom: eud: add the QCM2290 EUD
      usb: misc: qcom_eud: set the TCSR check register before enabling on QCM2290
      arm64: dts: qcom: agatti: add the Embedded USB Debugger
      arm64: dts: qcom: qrb2210-arduino-imola: enable the EUD

 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 25 ++++++++++
 arch/arm64/boot/dts/qcom/agatti.dtsi               | 34 ++++++++++++-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  4 ++
 drivers/usb/misc/qcom_eud.c                        | 57 +++++++++++++++++++++-
 4 files changed, 118 insertions(+), 2 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261114-qcm2290-eud-81e10f3a8e5f

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

