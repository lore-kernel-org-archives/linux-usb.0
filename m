Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425036;
	b=llvAY5mTReZJpgFqlGf9JD6uVFq5i7BQuDN8Slwu+cW3sQtwVDKgiYv3j2sdRUNB7dHQ
	 QxZtlWh2QfuDjtmFhbixtXyaFteQ543VgXqW2KKjjoO0HwrGonVDRfH0f9TYQoSkTYM44
	 FBfydWR71rnII23NnaA6Qd6e6Zk4gxQkKYLP/sXSD0tcbw5ePmrw5he0zCuC2x7w0rEy3
	 ZuRox/6801UdsICWCH+4bdM0HVPYFOuaKgOUGePSi6TNPf5gMJj/CLCosdHDI9gI5JhvQ
	 4/jSMXPsFWL/rcN0tomdldCOiU1kUMLdA7EYMP/cNT3i3axQGWMeE791XXs9mnFMY3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bEFV+1B8rKYypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=;
	b=XmmGPKUwOySmZw2LUWJy+MwylpxQwfs5PGOE1E3lajkinz6Ns1eaPyKrxZPQflLFOTsQ
	 1K6VPuufjP6bl4gQXtp/YYog+3ZjBMCLxdRojDEKuujJyZRCQV24DeXmaGl5kgsQcKLa5
	 deeayQsfBujz5nwWdysAq43wzxhOoc+aRgPpyzHQwa9FgKyCzfIVPKndQbObbMH1vRbbO
	 9ZYzRB3ZKTfA6N5vhP7NKPCKzOL3THYsWBWjkh9sPEisY/G1LItMwanN2yWCe5idNfz2Y
	 1Mqn+kdT1xfyj5iSwYVBr2lg8a9bLqzNT1eI+6ybASKU/wg2IQArwgoaVj24ueo91aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pC3tPOtG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R61Dmwgt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E363606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 09:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E363606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pC3tPOtG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R61Dmwgt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN69Flj1011329
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 09:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bEFV+1B8rKY
	ypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=; b=pC3tPOtGbJr7Gnzvnr2IUGdZWHS
	f96cQLRFXBf+RPxdpXEsipNm1ljDqUEFm7d6qv8fk+7MPJYfNKVk3E8IAUnuSa1o
	njUDZOyJm5UiHK0nxhi27pqAd8YWc8h/itjKM2KpRu0uQBlD1XBqldrNfa/C63OU
	5yzSWH71R86HyipHyU4aYCO/F1jnAmEuqPLyaawnWyV2N3rE+FDK6A7jZOtOa2QS
	6cHQDp1xDCIQ39ZgoO8iJvSudtK/fs5MFpIy/4PIW6FfwyTa2S7iRaMcFMdV38Un
	rnk63GkW/vdgcW02twbk9LPYBmqXUzm6cPNfG49RKLYF8ttINIt6+8r4VOw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyh0md7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 09:10:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so3523923eec.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 01:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795425034; x=1796029834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEFV+1B8rKYypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=;
        b=R61DmwgtWjbUCjFlrYqTErf8DuccdGimjPJaezallQBJuzZJks2QNszrotyFhP/MAm
         XnlgsoHOnk0VeQXADXYmInVZWbiFTzBSCAQoTLfe/+cw8Y3FiAC2AGUFwBiznkJK81yv
         3hE8s+tlMvakl8GKSBqq3/8Tq8zr1kF8RccKwDtFfSwGVT9U3pjoTNmR7wTsf2xu9X4m
         eifwXSdk96aLmMIjG8yidkwVZNk0qNrta7bJSuapRJ3BHDeOaTi6xMPxcy0L8D8lSiO2
         gAMuIgmOXgfhjpRdGCHH3mgAX42y84FwItCLUblbk2pFoKxtju+dsiUbG2800f0w9n1m
         aGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425034; x=1796029834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEFV+1B8rKYypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=;
        b=jFN1V28txtbbB0HZE3fDnPhtNzmXrgkMQ4nlC11rm6aQv/YMNvfsx/F5N66HI63ajG
         EYd1P4zFFZllAqhliFovhKRMsjqJbRTJzov+fvJTR39JpmdTClNwUbUqsk4ct1NXZpM7
         uPsUJ1oftcx6jYoZqy7V7CcwiHuJajNhzDFUGKE8sdK7PPLZUpoYWfekthKUtJJ9nqGl
         TufINLujcQ1mHifbPqxUqnm3/DRda6kMs3rR8B5vUGLxbiGyzeAmNW6ZtpOTP1pSbQlV
         X4m40JIQz3LBvXXZJGhhLUSWNEWnUiZ/xE3nlJ6D68xyXJIGiOEeVOKnf5tfkEmVMUy2
         VLRg==
X-Gm-Message-State: APuU4Z+S2gA9hJH0ugI3X66tFWR4Pok7IAKnDfWCCq+BSXGrf7aDonoI
	/d5/T5z36vXYNWHyPohrLNBiiVeNQD3gMgxFbiQqpsbyn0vVJIINK4hcVGIDjduVvVH44uRkYGS
	ujT9ZHMj8V9ieDj6OL6+KQCuoXzAJv69yNKl6Y2tb28ETjmNu5lw3pHLkQk1lRx8=
X-Gm-Gg: AZFdTZeBtCz9JhFmE9/TP0IthdW0EgqG7FxD3qaQYSyI5wvKzADW6tQIvgRbMsr9hmH
	tunoi2MyLFT8mJAz3vlwMrb9XUrsZeosnxhBjOHOhqnsrDkHAGi6F1c8gRBAZYTTISY5/JlyR2I
	l/g6jnesjm3uwPO0HF/BtgIMYX/XyjNlyK7BRviDA27bliey4UDUSo+EEAxSo+X9JUM4nWcPvL7
	nWTb9m+KLb2lrCiYM7QIt1TXlmgwlFt94NGrRYvi7d8Ptu5LGGlkf4DPpid9kdiDq84myVqJW8X
	vOD4kpd7GD9LPKDyI3WkIEInDd7trDGJA2v3KpzTzmImyYwk6TcXa97TD8Yf3dheiPdwBZK025n
	7qYQ8bL6ZHClYBKIJF0tCsAdTU/IM2e3HxDrkMcN9A6uPiNxKcYrOGQDbAgQ33dOKkzBVOt9Ts5
	sySg==
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr12610674eec.8.1795425033629;
        Mon, 23 Nov 2026 01:10:33 -0800 (PST)
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr12610639eec.8.1795425032934;
        Mon, 23 Nov 2026 01:10:32 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm58687105eec.3.2026.11.23.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:10:32 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
Date: Mon, 23 Nov 2026 14:40:23 +0530
Message-ID: <20261123091024.2214918-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
References: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=NM1AaE6g c=1 sm=1 tr=0 ts=6b04030a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=kY59nFXYWS7NJFzbzp4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX3gpck+nrxLfj
 06k1iH4zCQgJttklKFKZswolmIoOOHMF+rBYr6JgTgnp2+unXKt68f6dpzCcNnP7N4zUXHkmsFP
 jCZGgWSGVNdqXcLjUHNGOlRQXXRx7pg=
X-Proofpoint-ORIG-GUID: uHjYuSIbwFBLXrpfNq0LjYk4LyihS9i3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX4EqDN4Pxps2R
 dvB/LYhvgB9b0fJnBLHGjGJld5NSLDvBcLFZA4NcwKq/uQO9DBtvpR7zzGtSOgl1NMACVu1zdfe
 su2sK/ydEJb3glEZhEMnbh1P2Ft4UcyT5cHKh0ivfgEyjuViFtbbMccntPeunJbTP4IdnvU4Hk+
 zvsU1WiWnrguQhYk7/IEVuIACIM77zpHLD2F34+xNJ+Odv1G5iBgpe5fz1R56c+zDfppqdikMnW
 MOxBst+9xe204WixW4C2dYeYUqRLf5FnQTPxEEmJyn56P3XLeanHjjEQpH4xD2Vuss+moQ+7cse
 ng1TnOD8awNtWTErAsZnJtYkgTpOdWdv3JIq3rJ5dxcpKA/IRETCRl31XMzILMqQPN9i7K8gRPT
 1Xtw/J/DiKfEQhHqsJ0id7+rfBUzzwdyd9j6Etvi7MfJkWbBm4DhKURPK2yfsarJt9jz1f5Rhq2
 5Wzv7oT7IrQ7qbX4oZg==
X-Proofpoint-GUID: uHjYuSIbwFBLXrpfNq0LjYk4LyihS9i3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230036

Add the optional orientation-gpios property, used to sense the CC
orientation of each Type-C connector on boards where the CCGx chip
has no HPI register exposing CC polarity. Entries are ordered by
connector number; an entry may be left as <0> for connectors with no
sense line.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/cypress,cypd4226.yaml      | 10 ++++++++++
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

