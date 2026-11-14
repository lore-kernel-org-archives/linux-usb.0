Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670765;
	b=drbE2U/zyuWIJq3jInNPR/VsV343JA3+USkVTaAt/NtnOLOAc+ygWDhuKF7YvkP1tyAT
	 kLPhqDEETtUHCfljHCzeG3XVzcWYBP0FKtG/8viNAk3TmkTP9o3v5DrSO1rU/WRCyreil
	 3iNDRfaZWiRJTqBrgJUsLiCXaQBC8rTNrBX5YzteBUl0PlsnBlf1eLN2gWAxvZnksw9Yi
	 2Os7M4c6WE7XAwXGGgBqL4IKyKg014CCUBV1p7a3Tk9K7o8V787miSVREIWUY1hbgqSzP
	 tAp4B7j5NF1GZ4PJ+PsZOOPbZsNGggmc0XoV/MaY8T/sLue2K2yBq2zH0cW4X8xLwLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hrqRIR6qjCPCM/+FGJdCXYUIyo0/YN8fZuFRUdFOn44=;
	b=EzqqMnZu6/KBT9lo+dzuk56KMHAL4doYXqBFQa2kO0iPkEC38HnGjCCrhn5NgwqOKLZ7
	 hUP+xv96ClMDrJVLxnr6BVg3wuGHDYLdkgAKDSy4gk/r0GIANYDcn9P1aSGpQpmjp/H9Y
	 GXaoonAkoL912JnvLuEmFJEcJP7hO5oCAecsGXtSXH7vILi6J/uJSHhgR3bL8yjWkkfes
	 pSXSziY/uDRcn29F5PhAZulJdgWx2hVCMaBTdLF6/AErQx/J5Uf7Mnt3NvLynqxWJcXoD
	 gfEric6HnlbQlSh0ZyO8p3CGLWMU4+Dp6QQsE4931l6IZSfUmSFxoIXOWTxClTpNOiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJ5dERUP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K91jUdB8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76D1606A32D
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B76D1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJ5dERUP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K91jUdB8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkKsl117087
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hrqRIR6qjCPCM/+FGJdCXY
	UIyo0/YN8fZuFRUdFOn44=; b=NJ5dERUP40lOCuplzsjQIQvEd1F/kSuFP2mZsz
	MtROmKsv3rhLeZkBKDu36LnnT4L/+FT340iAaUa+hgGU75PtXhQVZd8xKJyLmRt3
	vhXnKKhiGDpOu4Nf7Oj/r80zkjoYlGPpEVgyYAPSoS71O0N9rfb+u1zxe8+c2qDn
	H+EXHuROidDO317QMgW6jERiqZoTW7z1YAmUrUmMlxdcK0FY7TJScS3U8nVgLEWy
	aetipLGOtjNlgP9xGYJfimwdbC2e1ilg38tDQsgs6HFch41sQ9VzUOVGKbyO8DGb
	SOaH6/CF60lQaqKBAoW+ZfHd14f4E6syAS71oiVIFMGkULXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqh4w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94961ed97d6so160715185a.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 07:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670763; x=1795275563; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hrqRIR6qjCPCM/+FGJdCXYUIyo0/YN8fZuFRUdFOn44=;
        b=K91jUdB88Plo788fch13ZtsICCRBETCrLq0QvtWPxK4C0raM+ojhua9hmEIdnq+yfv
         Ce5thanxSEX0/fp1wlCA2FZxaL6DhE753hoPTOedBZa1aANXdhPuH7+m+6h9S9QsobpC
         0yXd1d8qvxZDUWW0op+A92+x8fG4+YwCCMTS2HrDqGqIs69FNcI3U4cv9t0qwC9u4QF5
         v6IstF+Zf+Tg/WqiSLW5byTHp2fzZC51mWdgjo/8orCpm4ZpUZHBA6kMaM7fSksyW3xa
         VV9xK8Ox3yYIgmdXMCGyHpx13NpijUc/92NkBcr7e1MF/3OpUrq5ZkbPQaavIJxopwdp
         7/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670763; x=1795275563;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hrqRIR6qjCPCM/+FGJdCXYUIyo0/YN8fZuFRUdFOn44=;
        b=badVkAQoB97B9qNSVQS2Ly3vtkXyhA8L7ZYRHjq6PJeL5dvvijjE/W8VHPXE7mvs+/
         YZ5PxgNosGdqWs5anIxsr6+QCdbTEIJjE98NY+eawLucd/mieY21rHyxYdklpmuxY0ir
         37wiNEf27FSVYhKFLkqspy5R1xM1GSafSlRJh3mzFXDV6Dh++AS3vXwpPkdk/LoUSG3w
         a7b8R4uQum+A1p9biImGsOqJpZL9mNYar2pDTuVZdEAJDhTTzcWgYtQUVFdaQ4aY0cTt
         K2IXcsXvTwQvsZrM05J09DTaGl5sw7DO+XoUZl7TkHHdo2Ww5L0U0B4/wmMhkAB2RJmB
         HahQ==
X-Forwarded-Encrypted: i=1; AL+hErHvyfxLofQWjlroyetXtVLI8ZeFf0Yx6qMqMkqc4JO+GxL1+Hl9Iq2t1KiAvEBg5Eq4gjSxFfjk5PM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7IW3opgBkrYzg0FuphJl3ATmKUbTgVmr/tFTkoqrjoI4SHPEw
	n4VtS3NPlSRYrXxuTG/qWges4YiE4SUC6nPbK0GOfidEwLYok6aNJvFv2nAfAhoC3I4FLVEjVHr
	ORrxrDgdKMU5kcB0H7/UAlR5Vkqdw4cN+/bX6gfI672JRKbg90/qrqdABgaiWFcU=
X-Gm-Gg: AYBFou1tkU5MRBfz/a8ouZmzl7WopRSedaND4oFAsQZwDYi/fkTX1N8E7MP9mc/XvzM
	MPJ6Lz6VESuW2xs3yKyFZqk21hkXsTswSpe98ZIWoS/O894FRw2PTLxcOLvccWCMcBBBrJPyJZv
	OhhBNqhhH/CshycdEge0XvQTBs2cvdZ7a/QQ+g72jHTdCaDdZ04RhRDHvAJpwzv7gXQPteJwHBF
	/A0Prcz9kNTzjf/TjdvZS/WJXqG8TOIeLRX9BWKtYmTMKYg9XLbhsi0X+fVIbYCULxxEmlGyzrG
	057wWcY9ZEukqFIAavek/0zE4oNtXweQ39Ikh3mF/QumahKkG4KuFCcDjY1vnjeB0DnvLplYemY
	IUKfdRkPRZDbo/3yv14jneqtiFq4dZrJ07HnAgemCVXSLM2q1tBfWjYi01tC2nkN59s12t+LW2r
	M+/9UGp06ye+VB
X-Received: by 2002:a05:620a:1a17:b0:945:c430:1c09 with SMTP id af79cd13be357-9493314ae9bmr1452402585a.37.1794670762774;
        Sat, 14 Nov 2026 07:39:22 -0800 (PST)
X-Received: by 2002:a05:620a:1a17:b0:945:c430:1c09 with SMTP id af79cd13be357-9493314ae9bmr1452400285a.37.1794670762326;
        Sat, 14 Nov 2026 07:39:22 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:21 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: qcom: QCM2290: add the Embedded USB Debugger
Date: Sat, 14 Nov 2026 16:39:03 +0100
Message-Id: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MT3cLkXCMjSwPd1NIUXQvDVEODNONEi1TTNCWgjoKi1LTMCrBp0bG
 1tQBgwEv3XQAAAA==
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
X-Proofpoint-ORIG-GUID: LIOkWqJtEbfAMn3eTFA2MXLBu529DSHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfXyMO5o7T5rRm0
 OtoWME76juRA+r70MUh1BQ7yBzE84KeCFdvOVPIkycM5y7HSyjn8To/G4XR4dzD5UbYF1b0UVAY
 xiMh8POjeMI9kLgZQCdTLgauu7pAqfYQdm5ikPfuw+n147nM2j5N+WSPFO+sAzyIcpgXknQoCIF
 UEyTaUuPWN1JNvL2NUXe69SXPVd6H9RnumCaCmFGtih3a4ry9Ou2ufbD9c2W2B+btCrBGXvvcE5
 FtAragZZXtRYst5wlUsAXMW4DzmFe5uUDRGUipRvqWp6WMXw2SwIcRSdWRNdUZ7zBnQr1DIupfV
 h/hYjvvxRDDLINMGdagibP1ZL2mIB0fTqO151l1SmkFStK1WmKEXrB9QJguYRts3s/mnu4FMfmv
 D+kln8728yDofBByyuZb3jZALVeHstAetCBbr7fzl9N8Mq7e9hs9G9zEaLAWIvXWYfzLWaXkhtK
 1tQH/5diTAK6blZ7rLA==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6af880ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=b45o4kL6AAAA:8 a=EUspDBNiAAAA:8 a=rVLXYBqpOHlN8aflTEgA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-GUID: LIOkWqJtEbfAMn3eTFA2MXLBu529DSHH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX6VHcHMrp5GhM
 yXPxnFr1crKfFioefA5W3U6iyP/g/q/F70346+NhEFrCIIEQauQPKuCHGB6SQowtDDA6W8REyyQ
 8gj23JgSVAdZ6Lla1m6Z4EGodYFw4RE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

The Embedded USB Debugger of the QCM2290 is the block the SC7280 has,
with one difference: its mode manager ignores the enable (EUD_EN2)
unless the TCSR register TCSR_APSS_SPARE_REG1 is set first. XBL_SEC,
the secure part of the boot loader, does exactly that when it enables
the EUD itself: it sets TCSR_APSS_SPARE_REG1, then EUD_EN2.

Patch 1 adds the compatible and describes that register as a third
reg entry, patch 2 has qcom_eud write it through the secure IO call
like EUD_EN2, patch 3 adds the EUD to agatti.dtsi and patch 4 enables
it on the Arduino UNO Q.

Why Linux sets the bit and not the firmware:
- XBL_SEC runs that sequence only when the device's debug policy (an
  optional signed image that enables JTAG) asks for it. Without one,
  as on the Arduino UNO Q, the board boots with both registers clear.
- The stock TEE (QTEE) does not set the bit either. It allow-lists
  TCSR_APSS_SPARE_REG1 for the HLOS secure IO calls next to EUD_EN2,
  with the same policy (write allowed when secure boot is off or
  debug is not disabled), i.e. it expects the OS to set it before
  EUD_EN2.
- TF-A does the same on Agatti [1][2]: TCSR_APSS_SPARE_REG1 is open to
  the normal world in all builds ("this register only permits EUD to
  be enabled"), EUD_EN2 in debug builds only.
So with either TEE only the driver can complete the sequence, while
the secure firmware keeps deciding whether the EUD may be enabled at
all. Where EUD_EN2 is refused, enabling fails with -EINVAL as before.

Tested on the Arduino UNO Q (QRB2210) with next-20261112 plus the board
support it needs. The A/B runs use the same kernel, with and without
the third reg in the EUD node; without it the driver only writes
EUD_EN2, as today:
- TF-A, built to allow EUD_EN2: with the TCSR write the host enumerates
  the EUD hub (05c6:9500) and its control function (05c6:9501) in each
  of three enable/disable cycles; without it the writes are accepted
  and the enable reports success, but nothing enumerates in three
  cycles.
- Stock QTEE + Gunyah (secure boot off): with the TCSR write the first
  enable after a fresh boot attaches (two boots); without it nothing
  attaches (two boots). Reading both registers back through the secure
  IO call shows them taking every write. The USB controller node was
  disabled in this setup (Linux cannot program the SMMU under Gunyah
  with this DT), and there only the first enable per boot attached;
  re-enabling after a disable was not looked into further.
- OpenOCD's EUD adapter attached over SWD on the TF-A setup (earlier
  build, same enable sequence). Not tested: RB1.

dt_binding_check, dtbs_check (qrb2210-arduino-imola, qrb2210-rb1) and
W=1 are clean. Elson Serrao's pending EUD rework touches the same
binding and driver; this series does not depend on it, whichever lands
second needs a small rebase.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55733
[2] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55964

---
Igor Opaniuk (4):
      dt-bindings: soc: qcom: eud: add the QCM2290 EUD
      usb: misc: qcom_eud: set the TCSR check register before enabling on QCM2290
      arm64: dts: qcom: agatti: add the Embedded USB Debugger
      arm64: dts: qcom: qrb2210-arduino-imola: enable the EUD

 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 19 +++++++++++++
 arch/arm64/boot/dts/qcom/agatti.dtsi               | 33 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  4 +++
 drivers/usb/misc/qcom_eud.c                        | 19 +++++++++++++
 4 files changed, 74 insertions(+), 1 deletion(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261114-qcm2290-eud-81e10f3a8e5f

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

