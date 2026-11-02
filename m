Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618269;
	b=vvMEQXYo5EU5C4z70ZrneZ1FRX183nMS3pq7uD99lWe0efM+GZ1cCMa8z7Yne5JU8BwX
	 4ZrKncFDowF/c7mbJ4P9vANoRml43Q+NaWvcCgrEB4dSTThnAXb7N9ZD3zA/gYpF6ERDC
	 DP9Q1s1iMxCLUFfd9utTl6iw4GweXjc/ulSuVLiJ8ZRzOyZ0TLTjobDY1OYL9TO5OGx7s
	 oD79aOsrJiKo4/+lS4PF4vQU6a8VPZbK1Z7DPxwaJUWwsdqUTU/ZjY/5vohFyWaishWsM
	 JfPgicrDbnhSYlXCxwFZ3JtD69QPxRWxyTSURGZ0ViXomYS+Q8kxRadYqCtX01Lvggw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618269;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96etKRTtbQ=;
	b=oV/vh7b5mqyRSdk5Lb1rGiAzxP1ocfANtviMw0TtOIqzp+us8ES4OTcEHX3HoC0YzFhW
	 7GqjzwOaoMns95jCCH7BqpxIBUSoD7XuuyXZpIhVm5FAc40hO+VBHYiEHtAqU6PQCxalF
	 VJMG3dP1nf962aOjcTBxIsAHwi7ZoyNmNayA3M0MCgzkLXS6D/64vtd1vQmOg5tAKkz03
	 aHATNMzpShtxLelYB1YvPCH0SQ7PIFHnhKnDQimdjjZECfUphWBfIl079YBRtNlr/DJjZ
	 eUgvGAP6kljoRONG7Hke8sFWAv65M8Xjt1KB/3BZO64VD/rTxcqleNo0yDlIUkQWjRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bcD33cvo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhkeCBte;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B08606A332
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 11:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B08606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bcD33cvo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhkeCBte
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMYU1821159
	for <linux-usb@vger.kernel.org>; Mon, 2 Nov 2026 11:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96
	etKRTtbQ=; b=bcD33cvokbebHC038E1MjpApESiL9JijynWqJpQhJSje1qkHHtz
	oEfv8Bftbbqu31bs2g36sMjRr9BLNoSfQxAtvek8YbXFn4XQDVkspjO0+VvBpBcp
	WL0UdgEP6aBqXRTycX1SYbj4NOkwDzqfSpKywJhs4goLJu/XJHbHVDtQPdSJVPAZ
	X+gd3qFxqwQgi0RRw4WUGe4fuMlUSJvnHcat8V0Npd/Sd4Nd2caM2XEx8gkniZyp
	4JjzwAXR/CAfcojJcgIdLifjXaNcK8yNVfVKBxF5j2m50xQ5+Ms647JLiFbIw6Bb
	KMZfNPqm3nEhf6VMSUIfojsboH5EWxBv/GA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hdc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 11:17:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so4158128eec.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 03:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618267; x=1794223067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96etKRTtbQ=;
        b=HhkeCBten0JAY4UYxT088DhUsXuzswkqbsJYabQodzxtY0DaFrSb26NGpLEdVRyxlP
         Ht+YrCxhZAEduEMW8ms5W11xcYY6H97EO6t92HDGRF+hdNQ3EG41GZKAUa8MaPczQYGx
         dU4Wgcdoh1OmPSLzoptQCmXK8dgMKG3rSIKqcgSluau2pmnoMXnY3NXZHSRj/7fr2Rxe
         GrEK2OCyUcODkcUTpNgdcW7BeUHOqdarYh4FLy3lyCIeREvQbLjX22134E9JN/zICCSw
         MJ9LNgxv7KBO74bRMD7Y0Uvwx6Bgcu8pGIDmnZiZbKN7tuG+vb4Sf+cRlIWEiYhVKlCk
         lcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618267; x=1794223067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96etKRTtbQ=;
        b=uPe2VuxjBN8cj3J9fDfNGZKV6k5a53VqYBufxRETn1DDzmnwrhd7YhoSN4Wxu6SFLb
         prHjsPQWlNLlC+NLxLdIq72+ML3cdDloj+kDa9vIY2fbz/AdRBVEa2Dt/bVPjoRZ2xyl
         TaH3LpnXy86AvKQtBr7EjZ2z1vMckhTNdg4qBpb0AvzQLnnnsxusA0whzQMcolXeCcF6
         XaKW/dDIR/92YWqy1cCDxJWMKYLGt8aEd7/jxTjJnf60/4zItcb0uNHh6zkENdmdxfRj
         fEzlnS7teYDE3FsS12DJemZrZStxOo3JfPFq9PwQT879O7ADNrCSxuuXGf2x6a6HP62q
         cR0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxY0y+OToHD1MwyQ1xC13cMz0eMAgwsE2dllIq+3J/fu46Nfb8dvwj5L9KjNZTopysEArfJSuHpPxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z98Q41BvfJgwiTdiTaZpt/mWm4N2UCCtXU7FJ2Jh7PITcOxf8Xw
	KGI5VFFKMYeoU2wVzVQXUhPmRFttuIMA8Sy1nBzXC8vrAllsbuKEiLA6nc2zZVmzB2idvJv11qj
	pthnnicF77HWDpXD++8AfB/33Kns3RAlmtDhVRk9AM7+krnjMZUhtQFrKhbV5XhI=
X-Gm-Gg: AYBFou2gDozY+cGePDbEqp/oqd0TTyrFsNuzfQOk9+2fx7Qab2pMxhKtTw2mXlL0Fv2
	coTWzJKHDa/G5E1JiK7qTGeu2hTCVMu7QyU38SQY8UNlDec4Eq7ReAYEnFcFMpoJQUGvIqLWvCC
	nYPm/2glc+IQvGHSuXM9ZXtBK0EIOx6nASNVWxqN4ztfGCt2VB3b6jsEHAk1A8i4JWg6nPASX5t
	UlCP3Da29hn6WQvdliCamJp7wdS1uehllDcvdTfitIyiaiMsUGhLqdt1X4tMkK2PCCCNyhQOuHR
	8UPUhwGzQHq/E03EZ3k7BrVgV+FbhrY42ishoNlMrRt1cfzQ6FXYoT5ukiIExNXCNHOxSFZLGZb
	77Cbe/K/1rvNgnYXhswgBVMzMHDWRgyJSIY9pzN03fjO8MFE4RkVCf7L5IGBF/PC9xQwzHUQSN2
	37lTXPnRkvJyXpISLi4lrwFZvku9d22C1M
X-Received: by 2002:a05:693c:88cb:20b0:36a:1e50:e45 with SMTP id 5a478bee46e88-36a423624d5mr14292690eec.9.1793618266651;
        Mon, 02 Nov 2026 03:17:46 -0800 (PST)
X-Received: by 2002:a05:693c:88cb:20b0:36a:1e50:e45 with SMTP id 5a478bee46e88-36a423624d5mr14292638eec.9.1793618265943;
        Mon, 02 Nov 2026 03:17:45 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm16492078eec.17.2026.11.02.03.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:17:44 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Mon,  2 Nov 2026 19:17:29 +0800
Message-ID: <20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: kZ1sKFg60AagViRgOGVUlgRaJIqjKARJ
X-Proofpoint-GUID: kZ1sKFg60AagViRgOGVUlgRaJIqjKARJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX+qYkyolC3U8d
 AF9+K2wjUeskgQ/9FCmR/+ceuCq6Sa8hXamWJwpeyLgO0FQkni+Xaf8hVZxwwCwlG91C9dhoBKE
 ZdYQGmpCpxajSTKHuA852exvcwUjjcE=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8715b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R9LytnawintqPorzxAkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX9njwrKHTXM5V
 OTPvtM/K5T/OpqPe2zyrcK9j0H9VxWtMpVAvFJmsE3LBuOFbBC196Da7F1wXKyrOaISsd2C9Hia
 ueONmNhmjppgzNq7bwZKpzBxP6wd21M0Pn89yt1bhJvCtVSM9GX5ciqMVZ5/GxZtV/ywE/8VcTU
 y8HxgFTHjupK/mhSwfK5Mb8vMQNr2Y561lIUmpsYngMhs1dT550Pd0xNvR6bY+4lPE0hbZ2wP2h
 ocTjlB3qSo2FN0u6GriXlhKMkhEddj1xeardiYJbZZ36e0ZN3V/86GlA3OkWxPcs9d6kv3B2dRA
 y5aaW2j8HituS8SaOQziCnL+HznRkEJ33n7WPWbtQcGx++wBevqp0D/kQSwAbenzUr8RfewULTM
 0/jnBoh/IZxcSwYZLLER3gPF+H5h11WCkSb54LOuw/n65+AgmpSMom8kgiKu7tbRMmkGj3rdXz5
 4xCrj2Z7bGA5uIPMy0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v4:
- Drop Assisted-by: LLM
- Link to v3: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Address Heikki's review comments (Thanks Heikki!)
- Link to v2: https://lore.kernel.org/all/20260911073414.16711-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 580 ++++++++++++++++++
 4 files changed, 750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

