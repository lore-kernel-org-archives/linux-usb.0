Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAB83DBD55
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278741; cv=none; b=LoJ4ME75c1yFtU/hSJ+f0YturWk+rKjuyleJ+B+/VsbZ/2IKBmkD0qaiHqx/h8/mLTCqWAJmBZD3IHlLNtPJo7huBZWtaVfalSxI5B/pZVws2jzKzcWrg7zQvntG9tqFwclgaT5SbD3BPJIrLWR5r77wQip7tnrl1gfgxUobgkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278741; c=relaxed/simple;
	bh=iKr+ORJN/0HmCwv5NrZPcwiCSwGwPmGXsiFEI46TzZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JvQYm1XGPhsfTY8gxjm5gGbzEuO/FNYQ8E/Kueb5oWSMDomOUJCwaWVUvyBnG6+Ude6S+UoqdH+mozqrmwjZSY/kkjJh7buKfwLqYBUW/kjhryLHZ7PnVLKOnffjNQL/JC3PNopuvFIw45dRITxsEZD3tzIp29oOg7dfcQmprLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l400jifc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VoVaXEjJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l400jifc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VoVaXEjJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cZxn851854
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 08:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=; b=l400jifcL5aKd65B
	5LUw2Bc0DKEUaD+NP5xqtPA0B+pUH7FOZJXvTs+5QjLB6A5Gg8elI6ZNoyfPveE3
	c6jq6vIIbzxH9mI9jgJ3j0N+TLBSoEiiPaWzLOHUlLViZNgsZmc/WjtUN0Bh+1wD
	FBsECLyhP50+rHKfuAww3lq6pCtK3FMsoNMX/+5UPmIhIgCf+34zN7ItdPiQRVn1
	YuBZTVahOP5+znFPqWN37skx8eW25UhncLxEY5No6gd7D2EJk6mlPGaNSy+HmlSv
	7ZU/elCzCRgFqR2DaXZBaHSiUoaiCj/LdbpP9HjwCRdDBT6RXnsOPSUQ69WmcMTU
	YlF3BA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p8ha9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 08:58:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so91937751cf.2
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278738; x=1784883538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=;
        b=VoVaXEjJgzgcakQ7j9flfYo8ay7oKb+LCzu1nywgGyphgjXW/pfrlxRc8PTsPUFF8l
         UY2ZKJD3GKkkqE0A/CdT8G4+p4ZuBg6WG389unhxpnTSdKp/tKVoiLFffOCHC9AL5gLU
         zTrNAnRrleoAk5YMXXADPlEEnieKslz46mcKHoxZ6hRL22bHT3/8AcFa8eX8IEzgSI6K
         RB1E60kF+FAFMOqAfiwaTj9kORJ3WgVaZQ7MiQga28hj5S9Sz7edICbE5cKGgv8e9JmI
         X5b/1TZR78xtFoxJFGX5kUXwvrqtS1ZzfCK0H6NA4XznzA7k3cJxpuSHgw6ZA/sAggia
         ssZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278738; x=1784883538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=;
        b=EVEVKAMOimKGgaVFQVMkaNtG0i3E71kmdGRnNPDBXIgRyaHqcpc5ip0ugQIBJot9d3
         CxDLnCgaRH/iTe9rMQB/RkBtSBYMR/fM0XPM/Ls1P/J1GUb9XqVNSksCRFQhj8BMLAO2
         AANKJAfKXAIphW/zwBty5gwSPVF0bCXjom0pt5MzJU5RcrSC809xYX4qFCudkD/xBNYo
         U4+eMs0GstcUmcK2BjuNq3iqeb1so5kUQWS/h36iz75Htz5dCowKAN/4lBAizt0qfgzl
         NrQj6+zGBineRcWBMMccyTjADaWGwlSWsFVXB6zr3DgQXJrCc/nNmP1JtN2mZ6egFlZo
         BT9A==
X-Forwarded-Encrypted: i=1; AHgh+RrMILNlIA18ZjSPxude9IYx+bTkCY06DNzFml5pKhWLJQy5NXkFXaSSlCbP/+JAIq2XSbhRY+xd8bo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM0Z6YyEpHXETewW0nNsBlagutkxTDGJNclz4BQmE2BcDN8COb
	j35eC5jBhQKLw3f2VHJBoW0h/uEWym0kT3QDiXcl3DAkZcRX4f9hh2OLXDWw9HNVwNdYLvplPaN
	z6Y1F2jrzWxk1JJO0X7aNmtiBtNBmlV1Nam/X8hQvYs7kQlV5ypThBnZByjjZ2Fg=
X-Gm-Gg: AfdE7cmWYr8XfvEaPscb2PVS+f9QUU+IAmFCWZsk6ki8tC0m7rXFlxjtEqU/SXH1wO6
	SJ8MRJX9Fd4MgpFbPDDjSMhFkY8jZbKoUp7LJwFBImmKv8x/t+Kvf4GyzPeV70BmN55gTsIKcqa
	avIao7rGZV7k6rn+Wtz+925lBHpJY2gwYZWFNJpbQEVMUE1c5kNjEpkwFknBV7EJMF7ripx4snR
	7q/D1m0om+fJKJVFQxYm0fnLZ/a1tO2r0bVOd8jk4TRIoJ93ZBIogQe7qvR2AywjZ5X8SZoU+k6
	P4MsnkIChzFZIjWl7K9hWmk5xAJzIW6v1bogNvRqpNS/UUrPwavuyrTOHiBbhKynqPPwTVW+dSH
	0SidGFPLa1YOqUISkd0gfbsJ6y/nM
X-Received: by 2002:a05:622a:1346:b0:51c:1eb5:333d with SMTP id d75a77b69052e-5213eb757d0mr12604831cf.66.1784278737610;
        Fri, 17 Jul 2026 01:58:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1346:b0:51c:1eb5:333d with SMTP id d75a77b69052e-5213eb757d0mr12604541cf.66.1784278737262;
        Fri, 17 Jul 2026 01:58:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e65644sm1911449f8f.16.2026.07.17.01.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:58:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>,
        Michal Simek <michal.simek@amd.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Swark Yang <syang@axiado.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/8] arm64: Add Axiado AX3005 SoC and EVK support
Date: Fri, 17 Jul 2026 10:58:47 +0200
Message-ID: <178427872043.9452.9219608850005529427.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: d8Ku6sPcud8JrhcH3uclzuSrzoAjPEjU
X-Proofpoint-ORIG-GUID: d8Ku6sPcud8JrhcH3uclzuSrzoAjPEjU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfX5czPA60/rXxx
 /vYbnpzQepJwGSzAqV8XrNjTT4zqoy/7HGkgw4XgLJokhzohfQZzHR+oq8l0rpkPS9kJeYcb6FM
 XJh9cvIudE+9e3vk9e5142KvWYeOOzpmbe1VgPEm2WUku2ylBGI9HSYgESaIkcSJgGuaSdv7AD8
 8iGKWUknHFt3To5PnE0xi4aWTyjhBBsu9jtmghe9cceN9yseMzbrEVSmWkAzxtUFZo2RzXPRJXR
 w7hDaJTRChrKVUdutOU9eiijRtdG8Y0FkCyVey6ztKNLzU5Ng+ljOTCiP1fC6IKK6ZvDvN2MnSr
 aW7gPpXxtWYDz9HaPsqKPQvgOTIESEhJoydP+SUzdXd1gV4M+QFB+wBZTuIqkXzyvsmr0BPLFhP
 nc6MToBlve7Ub/Don11CDeqALQ5/DuqnKSnZzRoxvsSDtZ7riKYgpbQXVnELeAfLceq2AFa0tzp
 7L7AnjtxGEWYz4TDA1A==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a59eed2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zGYnv34WkyyXCUjmJXsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfX1vkddhVn9Emx
 3ADaxZ1k4YII4Px3/JOIvY5sRe1XwPku2pvF/+EW/ZOwy4BpjncI6nnXdqTfBE9QCCfuW82nhdh
 vGF7TrA16xxye5zmsSKd7i705Di7Zug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170089


On Thu, 16 Jul 2026 20:51:07 -0700, Swark Yang wrote:
> This series adds initial device tree support for the Axiado AX3005 SoC
> and its evaluation board (EVK).
> 
> The AX3005 uses Cadence-derived UART/I2C/I3C/GPIO and Synopsys
> DesignWare SPI IP blocks. These are already described by
> existing bindings, so the device tree reuses the "axiado,ax3000-*",
> "cdns,*" and "snps,*" compatible strings; only a new SoC/board
> level compatible is added.
> 
> [...]

Applied, thanks!

[2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO variant
      https://git.kernel.org/brgl/c/e8a40b3566887c1c83d4cb87058d4e98ec8b4a14

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
