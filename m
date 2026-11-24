Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510406;
	b=qZbBzQM8JJnDIqDNOqCZ929NShE0zTPb6pD0EESogwC0+svQu2Dc//tg1zVMFRJ2MS2h
	 5vXm5/Om3spKyyuxsob9FLhZiEwcZ6QPIZ0rZeM58ZYPCDmzTiz2u4oyQkOtQFrr+H0Q1
	 T9F/NuBbectNt+VmJo1vi7TuzAGolOF4bmpeon1A1+3U7rFxEfG7djEK9VetmtTi9xnui
	 WfYl06uqD8CCWI3LcKm9zH1tEuvXnKXJMnjLAN/tR7q9B5Zuy75PzaAmD5JGRYwBtkJpa
	 EYP21sPUjWEckIZv6NdAQpS5wXVX2q6qEULFCur4uHzQF/GHosoTkuV9sE67hyFXjIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CQ1Jnl9WpIeR0ueGSV00aaS8i1VRkjGVw741YTuD/Jg=;
	b=AImX9k7jaQzbl9SDgAhgzRWQ9JqmnOGfxmpOKJQiFpUt1Z2vKRibVQOTQL8XxUECf8JR
	 Q+GMFNfG2J06HLUQ7CTS+2+i3diy/PTI8H76czK4t229ypyuCulZEJKj6urR2+3hCSZd0
	 6lA1ZBDxNxm9hsKqFy11Bo9+PQkeEmmWZDaFOwuQlws0NxYseursVDZMcqpGchv0rQayu
	 85PfOGT91G9eG1xMLF6Bqfzu6qG+eNx82NCMbyyw/fM2MXpAXfPfye4Wfx6rL81TXEn4R
	 HeusDiczliAbVAncMweFnhaD+1SLU45QePayeUy5bXPvqqtwk9yPkF9wAqadqn8VKLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxJUvYyU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEXP7fvo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E4F60A2611
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E4F60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxJUvYyU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEXP7fvo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8X8AJ1598262
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CQ1Jnl9WpIeR0ueGSV00aaS8i1VRkjGVw741YTuD/Jg=; b=gxJUvYyUhv/RRlw0
	R39BOGparYm+4e6TxR4VPLqDmpkNuScZnJqr+9uTcR8ddE6DOcvSmu4RxJmLRTmp
	WYUInxgNABQ7oyKTRCRjBP5HIaoqOfIfGG/xHI7p6/2yIEv33srbhBSLDmT87y1u
	tM+NhB/CHR0qyz1rUo0r3TrKccnr2bEaqCIJHKuNrmGRKIXbISD6KLe506ArHUcy
	9QNvMoMZRNV1BF5kUsFf4VRm4E29OVrgJymaYb2g+UWOv80Cbd6Ph2ZsKISSyfxo
	OQWTIYGzP8ZEYmHcM+K01RMZsvHjEHF3bGxmo/RDdupRQqWmDHSqLLCIqxuBxgTV
	cvrr2g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqjp7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:53:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so3978381c88.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 00:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795510404; x=1796115204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQ1Jnl9WpIeR0ueGSV00aaS8i1VRkjGVw741YTuD/Jg=;
        b=XEXP7fvolTO5PrvpjZl6ahoBsl8kaGO0zrvn8Q4HFwXWMrqjK3ZCVcKylVKK5ZxQMS
         22LmrynI5zofwDPAdGvCWTlPG4YXHlCf74kXBdmxR625+k0LrFImsgftQXwkBcbD3FKz
         YMS2tv5u4CscPhofdb5RK4XwwdMd7E9VO6DWckPXqlH19I/tFGAUpFTidSaU26LLKhCt
         Prr/HvklLsitszXhbFIvAPA30omVBMVbvZrxziUSAWy5Wwbjb16SHP6s00JAMaTZIf1q
         24ka/beT71zYO9y6Z+Cbm3POG2a5rvLrGbHhRftmJQHGqmY2rVbgnj1hWYgO3jGGjyZK
         H8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510404; x=1796115204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQ1Jnl9WpIeR0ueGSV00aaS8i1VRkjGVw741YTuD/Jg=;
        b=srZDHx4Vefl5t76misdmr6JXbFhAdd3ArM4ceQsGUoH44IPcbgS3h04SsqE35+KeLS
         342fAg8NyfX6DUXlh04W82BbNupqVobIKK3sg1U0XYMtVyTNXSHLHCzldE8wtacZBwfD
         SgNEpt2ZprOli3ev5smWY26dEUE8Hx4FJVRINXa42jw2f0ePxTDmfdSh4N2ufFfwh6OP
         /7/dGC1v9xMXcvfgoZ4j/WDPXQQ482Eb/669lry7PMuKCl9CFuRnSBtpJLOXLIyjs+KD
         rPleR64UJIsYGWtD10pxu4bztiqdA3dA3ZoG65x55W7/aKaXSQbgueUd1wtDpPwL1fgf
         EFGw==
X-Gm-Message-State: APuU4Z9yLAqiAVFQWZtSriBoXIbQFlbW9j+soVB1tHg7tIbAOwfOhRfs
	ZCWKA+A4cynqKj42b8ha8BWPuVqbzgZLz1tZVH1h/qN5ZapjlxiHbbDhCxOP77yMVhVh4YurkSO
	OZ4rbPSJ/mWrhAuGCrtFUnKglkRtQWnP5g0gUFZ0I3XiFPSgHykwnuB1Gw7TcnVs=
X-Gm-Gg: AZFdTZeOCfPctrG0tzMWeGpu+WBH+mIcVse4sZMM5m01iRd3GzBAlwCwfIlPYRLbflA
	uZ07aXJqeKtrMdjTj8HhJ4M3ZZnSfChFpTk2dJHL0kO0XjbZDqq00l2bshCzxELzSbp88xL5fhn
	cYwVyaaFw3aIlAeVhkRLubnfyINaQ+B7KgQOxQ6rVCK2nkcXtFjM/2HjWi/H65JpgNIIGunqqjf
	7rvvANulT+fDaBTuOt7KGMKv4VSr1YLwGHzpjLcn4EqaOr8/fyIG6SaV5NRaAqFtd82iQyTzSjj
	wntStLWoYY5uijwaLJ5swbNVUQYpEMBd/KoG3n6X50GHr1PMp+rL7eS/00XiDKhGBjDKQHHIsc6
	OnEv3Xkov3IK7A0PHI6XCen8SvYpxwvtYLM+Ycy3Sd3I9LBpmMH3lixoJsTUyLjGoJOvOHgSQgr
	TqxQ==
X-Received: by 2002:a05:701a:cc84:10b0:1b5:709f:d510 with SMTP id a92af1059eb24-1b5709fd63fmr6813641c88.22.1795510404076;
        Tue, 24 Nov 2026 00:53:24 -0800 (PST)
X-Received: by 2002:a05:701a:cc84:10b0:1b5:709f:d510 with SMTP id a92af1059eb24-1b5709fd63fmr6813611c88.22.1795510403539;
        Tue, 24 Nov 2026 00:53:23 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm21748199c88.4.2026.11.24.00.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:53:23 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:23:07 +0530
Subject: [PATCH v3 3/4] dt-bindings: usb: cypress,cypd4226: Add
 orientation-gpios property
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
Message-Id: <20261124-ucsi-ccg-cc-orientation-v3-3-73cd114e5393@oss.qualcomm.com>
References: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
In-Reply-To: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b055085 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kY59nFXYWS7NJFzbzp4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX/iH+A1BzKTwu
 45UGdxyOUk5qzp91NYv6a+lS2siFvXv8WWpL7sZ29jvLi5BbJ3hqzMhtYHiLnsChAbFMXxe+aXQ
 2+aHjW+Ae95oyR/9KEgwWzjGCd+IDDybtTANSNZNlLH3/cvBNaJCyIyciJ1CVMWbrEhhwzIw3RL
 /oEMxyvKfCxAj5xU1a8Jifn0fpmq/Y1GJysxeMagw7texbSBh+fNcbOtz72R+wDPCn5A09GQd2/
 7n9TK3UZ5SuSuCbEX5qlD3GIuw3v/+iOxx3HrjgEL8FZeScWQpdms77vBsSOKdGE5Qg1BIX5Tl7
 iHdt6pP5YP07+tu7bosKXhFeDO0I3WofowAveWR1ldcgPjoY7ta/Oi2bB1LkCY0KPJxirQZu9RM
 2KUcfEpZ7EYfgoVaMtk+g6w2ngLVihFnccXzicPDV0sxfzni/DYx4+8hsCYROfcAbppAZ8njl05
 GCoErIG7AhK2b/aJc2A==
X-Proofpoint-GUID: Rn00ALKvQH_kCwE6L3EE2coBd204p3cA
X-Proofpoint-ORIG-GUID: Rn00ALKvQH_kCwE6L3EE2coBd204p3cA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfXxRcbwCmXL9VV
 9glOrmUL1/cGFVvrDT+1Wp4bRtDRfRuttG4MLmtK+KDGDWV0ekMMmAQKsO7RHPVRJsia9iE361G
 DNjIFIhcD216uldxsY8XhPcMsWG6lqc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034

Add the optional orientation-gpios property, used to sense the CC
orientation of each Type-C connector on boards where the CCGx chip
has no HPI register exposing CC polarity. Entries are ordered by
connector number; an entry may be left as <0> for connectors with no
sense line.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index d923ef82ecfa..298afd2542d0 100644
--- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -59,6 +59,14 @@ properties:
     description: enable IRQ remote wakeup, see power/wakeup-source.txt
     type: boolean
 
+  orientation-gpios:
+    description:
+      GPIOs used to sense the CC orientation of each Type-C connector.
+      Entries are ordered by connector number, i.e. the first entry
+      corresponds to connector@0 and the second to connector@1.
+    minItems: 1
+    maxItems: 2
+
 patternProperties:
   '^connector@[01]$':
     $ref: /schemas/connector/usb-connector.yaml#
@@ -129,6 +137,7 @@ examples:
       };
     };
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
@@ -141,6 +150,7 @@ examples:
             pinctrl-0 = <&usb0_intr_state>;
             pinctrl-names = "default";
             wakeup-source;
+            orientation-gpios = <0>, <&tlmm 137 GPIO_ACTIVE_HIGH>;
 
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.43.0

