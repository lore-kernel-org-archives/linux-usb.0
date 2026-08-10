Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B21443A95
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 19:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389824; cv=none; b=FaETFIa4rzmGkWlpFMllYtAvi8fpf+CDx2f1zqMRl0PAP93TEmIkj68PPA8ue4r4dOeFWmpmNt/glRElLmocty06IQT8qonQPSWF/e7h21C56/m5wfFNFArK3tIaW/Ml8PaWlrmmZdwCjmMEdEp8MRdd0URoHXeN+WjZ6a4Wwu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389824; c=relaxed/simple;
	bh=aRDV4NQWV4NsgjCi9yU3FrOsRVicWQRjtrrzW8lU/pY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtQfLeYpZUbu2d6wVlTkAvdvvTHnVRUMT+w+y42PeHUqgBXs2hJgL77g1K59+O5YreYHEjQBafR0R0NxFtKaSfeK+18FsyE+2/NbVFLYGy5aHoPJkdKGb/J17W8X69/iASr12slQNnt+ekhaNoFVW0pqMmiYt2bMocce3t8a1fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGiimiNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICBPubZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGiimiNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ICBPubZC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AIwJZt2439521
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 19:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UEE6eSLV/vfoLlOy7nis2uUfvC8WaM6ptAHuOkuMCto=; b=iGiimiNmUw9bKts3
	5QOSmQe6o4VlH5+n3AWthUul9VWWn33sDrZy/Qzp/UhzdmWjHAxBOkN3jR/b9zfh
	jeBQCAfcgRzshqrw/YORCOe2Sn7xvkq4gvzl+++UQOWkfvp8B+GBcdOeQ6gSC+K1
	CKSaK+6KjIjGA65B4OSn0Mp6OVWSm3+vdB+59JCieNyVmfWyY/YRkuUdLtN63JCb
	0jJoZsd8B0sIA8BFsTGZQgnmC1aF37FMknngEXyYWXdfJPshC9H5T87G+74Ox8LL
	KTMzSAbXTnZP5BCrJrCzIYH2VfepJAwgvBJWgTSxiOU+WPyupchIVGKNmCBYh1Zq
	ZDVH7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjv0m7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 19:23:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce8a76df2dso39124545ad.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 12:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786389813; x=1786994613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEE6eSLV/vfoLlOy7nis2uUfvC8WaM6ptAHuOkuMCto=;
        b=ICBPubZC/DnXemTKu34nAZ2re/R97UErMvAdBPHI+jW+KNlC7fLUZbb1cEMdJV733f
         XLUfEBRxC18tCnqKbg2qQk7L6Dxk1NXVeNrCnB0jyPFy5En07ISqp7/AKYdFX1TJjqXL
         3T7+4d+9O/1RqiGgtqXryekGZZAeNdiVljHZqX6vbih0sFoSDZYLTpd+ivfRSwXt+S7I
         sLKVkycjPtOzLE65mqE0aAk7dfOsG3UODvIiMLGvlgMmA3IkMGp4Vyvz4fg/lQC4AWPQ
         SNP++MNcbmnrolzxE5bSTa50q55V/gOdV1Avw0eHUnxirf+6ncMeqyGC4jQ/5FNBpJDG
         sPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389813; x=1786994613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEE6eSLV/vfoLlOy7nis2uUfvC8WaM6ptAHuOkuMCto=;
        b=oCTJUKoWO91xX+hXnfCtDMAdf+AO7XSlqYHmVmmns4wX/z6iVaz+Fgp2BOylKIlFTK
         npW+F7EZUjwAfXMAYnmzbyntwjOtmstEGC8yCqWCa3bbSR7xXi8h14X0zbUefDawSTht
         16tJQI0VumLNe3yA4XtkVJ2f/qigKKnrAyOJRlX2Zcoo5T53aQ5z1hPdBqfsXo6ghkrN
         IRNj0WEyBUs2+mrBlApp/GnBJVqQlgOO3XI8AJZ9FlauXunCDmOI4an4mNw3qgO+dNvs
         onvLA4ZdWG7pvPh5lVAhM4EZwdoBqFSGN1OWM9GS1pDwYJqbcEXFuSEMq75dhXCby6Lv
         m6AQ==
X-Forwarded-Encrypted: i=1; AHgh+RooB2wt3DtlmpClfQQsHQf5Qy3rHVHj2yflC4RBuurIsRf+Xa88kVnbjKqpUCvkfggH574fGZSFmfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT4bccsG16SC4HSOPGyuJQJjD9pe72fBCtYK/a8tBMfLRdJkYn
	qCWDbW0mih67YknSqk56iCA7Pmsok51Q9TsHVEtanYbx8vqrk6XJ+jWksO64QRCGViI+Me/3tKR
	W8Bu/gJvkZW/Zbg11uT9ENtnv0SCzKLtU1MTsCnunI7hqVhXsSvE6HBX9TWPmjmc=
X-Gm-Gg: AR+sD13+ANFNp10EXZaRh7DnHsF2lqEwE2pmfa/Le9d4WqNPT/tKfb6943vkXxVi8v9
	m3EaN1sVsnXuW6M6939QBrLmoFS5PXtDQgiAvxi80Euc/AQ7I5QKku/T3ybrvGDgS7zp68F+vpX
	kLW9Gwzk2fddXCW++Xkqu8m4XXlu0KyBov5SbEcGe5CNSAAnAwIq7IjBn9tEJwubnZ7NKh23SJ9
	5ZI4xZNZLpEW78tjruMITGPlZlt65v2f73WByajx0jRfI6HjJbDZHT8V7Jll6Om4nd5al66R6bO
	712rh5EUGsDU24JCUDNpfbPxuwh1gXx66Hxc2zJJx241JYZjkCcLk1hnM+KdwFA3VRjKl/pqOy9
	6iJAVjwgkSx4j9f/FoCaEsIrEx+5YAw==
X-Received: by 2002:a17:903:3904:b0:2d1:1a28:10d with SMTP id d9443c01a7336-2d3004508bamr47137925ad.18.1786389813579;
        Mon, 10 Aug 2026 12:23:33 -0700 (PDT)
X-Received: by 2002:a17:903:3904:b0:2d1:1a28:10d with SMTP id d9443c01a7336-2d3004508bamr47137255ad.18.1786389813150;
        Mon, 10 Aug 2026 12:23:33 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm79472110eec.18.2026.08.10.12.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 12:23:32 -0700 (PDT)
Message-ID: <cb5b70bd-0dfd-47fd-9544-a2c505c4f415@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 12:23:31 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-2-elson.serrao@oss.qualcomm.com>
 <20260807-shrewd-white-mayfly-a8bfea@quoll>
 <20260807135239.GA48030-robh@kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260807135239.GA48030-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE2NSBTYWx0ZWRfX4SeizF1QFOXY
 k0unh3mgzNofZJhMCcBAsFJ6AaxZckgBeAoYM3mHXnEpcWJmZ4leFBGsM8Sb6zGtTqf2+n2IJXI
 7LsqQHqQnRDGR5/MJldHKNOtAtY+Dt2khOaShG5p3/JvNR3nQ/ID9X61EiUMbOXF801w0I0z63k
 Aad+pBz38L1gwprB0hOObN1x2LsCxLXHQUOAfSS7LtUtb5jxv8WSWbdFLXJX8eSvopH7XUCp3VJ
 pqzuXp4fQP5TEdETw+FA//wijblEAHpYwN51hQDJqLy55uBW4uxcdLqZOdyzESyCXIrmBRQQFq8
 WEOy6RnmMeQZBlRUuZTx7bKA3VL69UcGFSeF4z2o9CRiz8nXhow5XgP4EL5JeJQbsd2Q8KOPmIz
 yifU+Pj+zx/xvjVpwAwt8rxXiQSib2dlKZbk637EnocQehTJblHbkmu3Gc2yKzheuzEcWHlQnzm
 h+H5Hc589QG/vcfavBA==
X-Proofpoint-ORIG-GUID: tLjOmcQedjYiFefDiJT80x44N3K1-q7Q
X-Authority-Analysis: v=2.4 cv=KLtqylFo c=1 sm=1 tr=0 ts=6a7a2536 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3weD0my5navHwqW7PqcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: tLjOmcQedjYiFefDiJT80x44N3K1-q7Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE2NSBTYWx0ZWRfX5RiinS2GiuQG
 asItlys8By++vsPW7dmlwko34f7I30GADJhaqET/eq25f70RxVixb22z14O8pJd/+8jwEaNg23z
 6617alMcj5fO3pF7CjgZNSWfNdaVS0I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100165



On 8/7/2026 6:52 AM, Rob Herring wrote:
> On Fri, Aug 07, 2026 at 09:20:26AM +0200, Krzysztof Kozlowski wrote:
>> On Sun, Aug 02, 2026 at 08:15:26PM -0700, Elson Serrao wrote:
>>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>>> High-Speed UTMI paths depending on the SoC. For example, SC7280 supports
>>> EUD on the primary UTMI path only, while SM8350 supports EUD on both
>>> primary and secondary UTMI paths.
>>>
>>> Each UTMI path connects an independent USB controller/connector pair and
>>> forms its own role-switch domain. EUD routes traffic based on USB role.
>>> In device role the debug hub is inserted, while in host role it is
>>> bypassed.
>>>
>>> The existing binding models EUD using a flattened ports representation.
>>> While sufficient for fixed device-role configurations, it cannot naturally
>>> associate a controller, connector, and role switch with a specific
>>> EUD-routable path. This is problematic for role-switch capable ports and
>>> becomes more pronounced on SoCs with multiple paths. In such cases, each
>>> path forms an independent role-switch domain and requires per-path role
>>> awareness.
>>>
>>> Model each UTMI path as a separate child node with its own OF graph. Add
>>> an SM8350 compatible for dual-path EUD topologies while retaining the
>>> legacy ports representation for backward compatibility.
>>>
>>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>> ---
>>>  .../bindings/soc/qcom/qcom,eud.yaml           | 128 +++++++++++++++++-
>>>  1 file changed, 127 insertions(+), 1 deletion(-)
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> sashiko correctly points out the oneOf logic is flawed.
> 
Thanks Rob and Krzysztof for the review.
 
I'll address this in v6 by making the two representations in oneOF section
mutually exclusive.

Thanks
Elson
