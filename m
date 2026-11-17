Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923311;
	b=lMc536jtBhMSZoidX4duJVSDbnmag8X3XVBmcucwINgVXCGeUZvEveCEmI3SMOhfg08S
	 rhSS/iaBmW+8YdaIb2uJBSOKC45Y7ajsoKhmhOZOa2DPqDOH8F6pkHKDqvJ8ij8u22KtB
	 kfKrTEy6krF/be+mdGcfFDQ3oaipDjaTiL5o61UkpZX3svBSufkO0B7u80FPtCWPq685A
	 kOiW7sVEmj0sJOFqeerbFOwD6YVyl2K+2F3RBC8jbo5SOt4rM96TBnQQFQwd/chGxWDss
	 z1/2SuqU+iFUtngiUg4/c+3z1HtzPgPiwfmpw+SUDud1hckrWcSSvp/fCB7d2z8YclQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923311;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lmrEMNg4q9t/ca7wGc6lOJyaZRJ9HdGVgitj8Hk3qW4=;
	b=gTravBc+ISNtsWhJAdHkMubNA8t/mJy1OJrooy3Mu2OlH4yMd9zCVZJdsOF03JFiOa5r
	 uhkAulTrbVV014AoqWUdglm+ElCjiQEqfsKDMRYBThiPlXlD6JjfBafYoysgN3ufytwPl
	 iE1gsJ/M604nsYaL6Y+L9EL9zxI4Qcc8tC/4jD7BAu0Q5TVjxnra5EY4Sbf6PU5mtK2HO
	 7N7BrW5+L7QsaTVymCzVAFOZy7XHtVJGOZNd3iA+9oQCTcIjKbioBjwlauILwPuDlGo91
	 A3hzSgh24cv0XoXfdx9WtXMOI15/ltZyk+8zHgTzmWCRzm1abycNS0uS23e1SGn949Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dh9Hl1Ns;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G0wtXWwC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20672606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20672606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dh9Hl1Ns;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G0wtXWwC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC3uH62096502
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lmrEMNg4q9t/ca7wGc6lOJyaZRJ9HdGVgitj8Hk3qW4=; b=Dh9Hl1Ns1H/p632a
	Sjll+Gg9OITC2W1dt/qrEAHy70T4O+FRHr3tgr99D19M7i9SbOgZhl3NJxyYgatI
	nGr4zSxrwXOSDRDbUGpQE0ehyQflIeYHhobsBKMd8hQbMKfCXI4wYZInQE7J5vQx
	/fG84HlYpn05Ziv4iLDGE2Be55zHqbVXCdFn9LNXUY3XhUoIGVtOgHPKV1cWQ0Dg
	IngzQfWskJFSj/Wj4bnoEXT89tXaFSh37y/hh7Uf5laZlRHJCtnFUh5Lt2rMO4x1
	bCbm02lkhXMmRjj4tz1yLYOzAK6wxlwPkMN76i1nv7HhpAFT2eYoNGNvYvG0KiUW
	X3wYwg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h2tw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:48:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6658232eec.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 05:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794923309; x=1795528109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmrEMNg4q9t/ca7wGc6lOJyaZRJ9HdGVgitj8Hk3qW4=;
        b=G0wtXWwCkC2Ki5oyY7M8zueSdQhbYcSm2nvs0qDadyCMGunmQualzdJ2LIZ50BrOGA
         jYfvtswS7dtj3HD6jq1djGfFMYSOcuQloPSrQ9rTMMQUewuy+WiXU1ceUOxbuyHFbjGP
         xRY+BdcUhYY9O6KN5cGCvPwJiKLBTKdYzzUq8w9ujG/KuyPReN3Vv8aDzia15scq4Wck
         Uc4wBSQfjjcPcsPQGT8zmSBUdYzNQxRqLhY5wIda3GW/m6Sxbb/PKtBf+oc/4g5bBrhR
         ZfWe2s7zSN5rzy2eVoIa45mqmPdrmfPV3Pt4nU0RS8ZcqB/8iBHadjK32fqv8+N06JK1
         Pl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923309; x=1795528109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmrEMNg4q9t/ca7wGc6lOJyaZRJ9HdGVgitj8Hk3qW4=;
        b=TZCRlf1mpjPUmozBp+aai6lNHUdG7eaINT35cxDg4fBfTWe3ZB5Qom/wNAVAqWiYWQ
         kAC0INpG5y+Qqzm+K4ZiOeVifx/m90JMJtIlVQKsCk9hC5rdKOegXIMF9+7dOZ7WAtDR
         HtztCwONgQAAqZTYs+j6OYtq3MgCWtHYtkf8eh97zazdbyaLepUkifwCxWoLLZ2mzGPR
         2cTHf7yWCkvMO34/LMlkavTUgnKr3gfIYJY0lSZ/paJg1SmH4a578+4uJpzQrBUhE+rA
         3GugKKPCMFGIauPsEG8JFpitbFPMCIFH3wJVEDu8+6R0HDDQ9IkskLR8EigP0vWFdtu1
         e1/A==
X-Gm-Message-State: APuU4Z+ryD1IQfpgrZZmkR6nQyNGj/km05NipjCm9t4tbjMJWjzs7AFO
	ZRFNoHsUCQCFpECCB0IiZfB4BGOB9dazAG81RBDujSQoiwPTLyAeOG15ph0Gu80fwdVZgM0aAs0
	Nl9IlrV4fRL8ExJ7z4wHU+nQTUg91hc9cV6rTMG6IDpeYZDNcX3iAqMGIfqmYeq8=
X-Gm-Gg: AYBFou1iUtLZywnGMs265zbtZijjOUGGf1VSWfrkKjsPt4AlcYX0CeuLDb2mhVHWa5v
	VPWiJgoo7nKW6NXafEDz3fwCUkCrs76tfctjSzMFtgZLgRr2vYp1DPHT5jG+7a1U9Mcx4/7NTVH
	Itde7diRNFhf5KlK7zkpC7tC1owMMaWQGjVDsPXdiQBGzArq1Lg3Hsed2ZJz5m4qGuVaaG8UOW7
	TFmkAfZ3QxQka94xj/5lRr8vMzUlqf67llq6EB35ahzJgjWfviA2qKGjr+rrjElnqh4k2ur4lib
	cchFa/8gsjKChHurNg8BAtOauJpKCeJo33LsNaLTcEYr1S7rWZLpDKZjuSlZPySJEoJf2ZXuyCO
	8S0LY/U3E/KqLKZisu6Wd8TE1TL3IjQePQjUdQuiql8mAW3bL5Mqp+NYFDn4caSSVbwPrp53s7X
	qYNw==
X-Received: by 2002:a05:7022:409a:b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b5030d7a9dmr10968210c88.8.1794923308990;
        Tue, 17 Nov 2026 05:48:28 -0800 (PST)
X-Received: by 2002:a05:7022:409a:b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b5030d7a9dmr10968188c88.8.1794923308321;
        Tue, 17 Nov 2026 05:48:28 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm42336788c88.11.2026.11.17.05.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:48:27 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 19:18:05 +0530
Subject: [PATCH 1/2] dt-bindings: usb: cypress,cypd4226: Add
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
Message-Id: <20261117-ucsi-ccg-cc-orientation-v1-1-a0fb052c7fcd@qti.qualcomm.com>
References: <20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com>
In-Reply-To: <20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akash Kumar <akakum@qti.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: -JVulNWP7FJCCQVmoj7_Pu29b4R-z2gP
X-Proofpoint-ORIG-GUID: -JVulNWP7FJCCQVmoj7_Pu29b4R-z2gP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX2uxKoHQao1nk
 0FlSTsmc2/ywvVvcd2XuXv7POaLdYCvaKs8C57ZnoPMUyPMFEoOF2OMOGcsmdV+14Z1ipqsqQBO
 0+bfFbUneRg4OM0r6smvr/cOpYGrnw7ql1viK2jHfDq8w5mkfY9ywiCoYLoqgmKKBY4SYybKuBU
 3ezHqxm7JlIq6R6HDFH8R5rT/QtMbOUcqn7Iv6UNSOi+koMriYW9QtHh8YMXsYsIpJGU7jyjJHE
 TYYRorfEIfzgIdhu0DXJ9WNR0hDJ2UN1+9p565+oiDwGBsGl2/muZz1KJ0CMOcHh203SLnUa8zj
 dYxKJv6mJWk5I+hepn3OTlTSQlFtvXBol8T4VjdHekX2nDakcXMZ5Kh8iC8CzlQ4wVCIFmVNpXB
 h+0LeTKhsQAOOZy/xNOlveh3duEzJ8f4giP4aqYpmyuwnGPn2mVruskdnWt2WKpn4PtTYK5ZXf8
 Y3JyFYuwElNK5S7qQqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX3L71zAo6IS15
 4lYXhQpbwAq2jK9fsP2WPyDXLNlMEudOeD8UzaiHudEXXHW0FlpIbXKanjPI3a/ruSbIfZplZYx
 jR++bUAGtOMdPC3zcqsV+loEahrI5CM=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc5b2e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kY59nFXYWS7NJFzbzp4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

From: Akash Kumar <akakum@qti.qualcomm.com>

Add the optional orientation-gpios property, used to sense the CC
orientation of each Type-C connector on boards where the CCGx chip
has no HPI register exposing CC polarity. Entries are ordered by
connector number; an entry may be left as <0> for connectors with no
sense line.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index d923ef82ecfa..5716c045d87e 100644
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
+            orientation-gpios = <0>, <&tlmm XX GPIO_ACTIVE_HIGH>;
 
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.43.0

