Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924603;
	b=ZM1VVixPL4OjOJXDOjY5pce5+vijjjumuCJjf6l3x0CpANVSyYGrYEmson6/j/SlY0H5
	 erSBgbrb1k9aL2StJbsvGSwoxxKZ9zJ6VFl3pj3z6EM1rE5jBRsafEn5fXQhfWOsJlTd/
	 j9VkKM0XO/eKSfB5JiqrO17AEZVdalVjOy5NTci4ILwXBcnIuJS+zwSev8nNGAXsrmow/
	 saSUlLnTMHDMEeAVrnOxQrEzC9eGwOIaER8IlrEE3+sawdQPsLcyqbXh7imD5D1pvo0px
	 NxdRrzniSMDQH9wfRpPuDTFNsmSNfPRT6dizLzJxXch2VYG3DTYFE3hkGuK3FnllWgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/E3D8dPaIt23Qw1ZQ9w0kfRvdbQWguBGHTJ6/4fGuSI=;
	b=5m05HUQD54p8YcySxBC/fgIcdYnOj1fAEkfUoOhPmuoSAxHCqmv+qh4elkg6vUyDDelA
	 L03Li4ehN3sidtj3S+dSVVfBCw2H6dY+RVxqVTL+oh5STDYRBrd5953dMkr86gPv7jFjF
	 OLFSX9+30s48mvXRwy55u4szGMZ991rG9UcTwhdJLwVrh8bKAKOzn7rHAj1etgnvAlsqp
	 bXx8ePqzj5UBBFzbaJ117ovi+3tZG+3GIlG0OMYBuHanw3M04+NiwLEynoqUkscBU3uFa
	 l5oJ/OCZueleIzGgRgnu2bU+OSeQcruQTsfJHInuckX9MylocbEY0N0EPlQ4vKc18wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mJW/3Fy0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2FgFd1p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093B2606A32A
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 14:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 093B2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJW/3Fy0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2FgFd1p
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC3uVa2096534
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 14:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/E3D8dPaIt23Qw1ZQ9w0kfRvdbQWguBGHTJ6/4fGuSI=; b=mJW/3Fy0zM0W9585
	LIF6G3TBdysSLcyM3vk1PvPoJiCAkrzARSZSR/PwhfHxArBhdt7117CPUVQj4v8w
	467paesTsTRetP3NV5Z9EMLSMidVBos9dvsViLlMRSmf9714eQVNn8NFhz+vqL+j
	yJHSSIRCF99AFiOYse1QgDrEeYn6Gsy2Ch1hQ9QYrXBydv1k1X7QGhTIdvZOHyuz
	jnGd3SY9ZDWUOnVlCJBqyJCW5pnTE+u0jNCcGp/EdONvN8j1lJoEoTHU3T+pJvgY
	keqBFSxX7YEdlerMm4q5WD9vdMnQTCt1j9lVMcEZGf+ut0WDdhpzRdjZaP4NeZIu
	7UK2Ww==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h2wyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 14:10:01 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-84c4dce8182so5153145a34.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 06:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794924601; x=1795529401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/E3D8dPaIt23Qw1ZQ9w0kfRvdbQWguBGHTJ6/4fGuSI=;
        b=J2FgFd1p5nZxJOv+a0KvUudHzjhc80nyQ8Ads/6bqEQXZuJAJowfrGbLu+KSUkUdq1
         ZGUeW2BiQkX9hp8KOBw7JkAgJgN7rzNRkmz4ZR/qWXAOUIGg9pDY+fN4To2IGrxzQj/e
         45QT/ZNn13i+oKh9Nd7dhzy3vHLHEBbDuiUfQJY1hm8pje6ehqp150Bzdwn8q5Ur5Jg+
         3LlbMFU5EXJhRKROM21gaxzCfEIW0kwTcOUwo9wMQ3r+MSXfuW+Em+rziBc0jDDJ+XjR
         LDUm9yUUk7HEJ6S7yUVp+pj8SxVxuKswZvphtVyJ9Ajc3lYS97gt05djPARaoHj9+Qq3
         0mgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924601; x=1795529401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/E3D8dPaIt23Qw1ZQ9w0kfRvdbQWguBGHTJ6/4fGuSI=;
        b=Qf29p5ePXkUf5owiUFGNwwBPjF5yByF2jazLjm5IrLB4rl45FTv2qz3NJMYYyUFtK+
         j9+fI/Ay0D4Sl2bij5mX0LElK3vhnYKoB4HNy9R2WHKB89td7mS6xk7HMkuopmKwOfHP
         PoJ4aIvz61TZV/VTg/Y9Guip6puBsvDmUnJvc1DCqb8fL08HoHXEnCe3BWVu3Zqqa9H3
         6uZjA+u4IGvCb3TEM/ypeM+tKNWuePQcmjr9em6Q2UL4QBuAvhcN/WJAXabmcdgXExhq
         XrTy18do7VEnWfK5oCWuiNiBbDWMO3VMbUSqCnpjZJ5qBLFix9sgl//w4pPaITlpT0sb
         j4qA==
X-Gm-Message-State: APuU4Z+7dL1i+1A/B0sdQ/twOHBJ2vSE1NKHeLlX9mrNDkAb/tepdxWk
	BQrb5zzZcRfZINDvZgngqrITWhdVki0uUdrF/6d3gommdPZqvPdGxFrihGON+Vu8GPg/yz9wuN2
	Y8uvAGBgzkSqyFchD++tKPejFqYQGyOZ1AUK5CsNaV4ZtaZlkaOB4UkdxjQiBUh8=
X-Gm-Gg: AYBFou1IHGZu/YxnWk/o1WNncXJfZ7WR2/Whw4XJCYZhQZ+A5EB1ByE5wQt1G5+ACSj
	8WD0L+HQ7+pfmPuVlF7iSi4QKKUECxAYlHAbwhSv77VjeSny25pAoP+I+lmC92TbTyXdazoh7XE
	QTDFEbU3QPNh3MWRnB4qi3U7B8m9mOq2zozFFWxuYRXNQBB76Xus2UuirEK3QoQRcpU3IP6hFuw
	AHnOxKy67806hbu3otuu4fOGcaVou61ah7tcwmDMoEnHsPymhO0QozlZP/ZgkXKNG6e5BEf4hFy
	o/hNKQIiu8bkhunA6CuC4Fk2QZ+QA9lgOolyrSoVXfENRCeE4C2jFOox91dEfx6JEKs7X3gOt0G
	rFf4JqvyJVE/o/cBWhbQQrBapI2O60dJH8qySatEW502vQsSgRJfo8eQE205iDl9Xm8+F+EAGNq
	jzTQ==
X-Received: by 2002:a05:6830:310e:b0:85f:ee8:26c1 with SMTP id 46e09a7af769-86289943c81mr16707454a34.22.1794924600601;
        Tue, 17 Nov 2026 06:10:00 -0800 (PST)
X-Received: by 2002:a05:6830:310e:b0:85f:ee8:26c1 with SMTP id 46e09a7af769-86289943c81mr16707412a34.22.1794924600075;
        Tue, 17 Nov 2026 06:10:00 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862d68aac75sm3233775a34.23.2026.11.17.06.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:09:59 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 19:39:47 +0530
Subject: [PATCH v2 1/2] dt-bindings: usb: cypress,cypd4226: Add
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
Message-Id: <20261117-ucsi-ccg-cc-orientation-v2-1-2e3576a11eb7@qti.qualcomm.com>
References: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
In-Reply-To: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: hW6EKAsR6PhHyg_JvMuqcrKacjXUNLdF
X-Proofpoint-ORIG-GUID: hW6EKAsR6PhHyg_JvMuqcrKacjXUNLdF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfX7brKYiv2QEe0
 FGfxxVI3D3rSN5pfTB6KtNc/3u3u2g1LB1en5u/i8CLsdG1Qkif0qcS6OSesM3p8Rnu43mN/3Xw
 ZL39bUjqgMchrDBeuDBUrNx+U69Rhn1V3rsxoqMAX9tE8ngYVNB7Yod2BrmSssssUkpP57e/lVb
 9bnWsd9Zr8SjvqCJXERSuXXS5IQ777tytBP6eVECXmumHvc7EcdBdVzJrEr840b+zoEoiG07P+6
 Pb5pTPRGhoTsAPtkA2tISsRFO5Ue9C7hnFpei3ZkOdyq0MVqF93/eEm1qZlKNdMaBNWA79KT6Mr
 1CB9IeEzTGT4tE9ajEgetojsqBHjUEFa7jKMJ6b7jNuDbbLKMUh9KU5hgkp07q1vKfZecOQ2F8/
 BmnFZnlV6rCfRME5kBLftppfSEvHpEoEd5myDulSOKva89blnYumjHqQPGWz6AjobY0Ut1QvI2u
 eIq5vB0WdHKXdkmeE1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfX6/S+5ou2H8FG
 3X6yqeQBgl7bhA6d6jOTeVLXnhWI+21iAzWkA5OJaBW8W8maAF0u8qE7zH7pZ8FzDWKdSbrwQDX
 f3V8FeAFi1NlJgiQ7HHfjzFnvoaVTYw=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc6039 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kY59nFXYWS7NJFzbzp4A:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170056

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

