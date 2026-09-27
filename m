Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090113E49C1
	for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790514357; cv=none; b=Ug3cmKUmM1OhbgbTG0Sjj8voACL24GJrwWZPoVPzrMdpwGuuQPU8kTuJA0WRqvDPkUrZeKUyjbgyOxtc7FukkYtawhcY7of+HHY91EOO48X7xJebYfY+R3e6z0O1wFS6d9W8GXERh+gDMgVGoYjxhzS/tWltDNRjaysx0IKF6jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790514357; c=relaxed/simple;
	bh=5PhNDLHcT1Iw8t7jW4E73wXBcMvAkzi2XT999lFdLh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwF7M5t3SouEFNACf0r3yRq3pmfwbqbwbbfXaYeyaMgDK84AqbFC7UXbIX4hbGQnriTKzMG1KCzGRojuIvHWHFtwoUO1kEAJBRR3CDw11MGEs5d3QeP1llIKjqnZLbhFGdgx3B8WYyRCIArRmOZSBWnCjemp6DYUGJCeFahW9vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6MAGmwO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJODZZKf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6MAGmwO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJODZZKf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68R4F2UK1842936
	for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 13:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BkXSWtx80akFwCoBF0CHDjIQOF+Xh2PE8+5HXZlOT+Q=; b=C6MAGmwOfdVa2x9A
	maezeYrZhsF9SpMTWajUBPo+2s3f7fQpCsYx77CY/WPaMwziB1n5xB5W8bYvNFfA
	+GBV9wCPfEe/BRpt+feGZJpDdKataviwMaXkYod25/cL+y6uAbaPbv2JLqknjMtM
	WrucOL+nJU0s9UYzCqeLBVO6JoMiXuObY63Tm5UnEwyGCHEIAC2x1OyZbLEkcD0P
	6QUcpeY7UNwfkRenxn2xlaoNymEGWMe9jaW4b5bB6U+Kqe9F61ec4sLwNz+OaDAE
	Bw8kf3NdOEFN1KxIfpMqYhHLmxEh3z+s8TobhFbIxy1/z32i1zTyyR9IaWKpdiUB
	eMFEqw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx64uu4sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 13:05:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530f49fc5ffso74851431cf.2
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 06:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790514353; x=1791119153; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BkXSWtx80akFwCoBF0CHDjIQOF+Xh2PE8+5HXZlOT+Q=;
        b=WJODZZKfo0IqUmb+skQ+0ALeZ8x1wL8MnWJSj6pviVO1Eyj0hZP/4GN/q4Mpi0Zuju
         Ns1jpqx4GMQb8qzIoiO/VNKyg1WeDGhIGeUUPubAmvQzo/x2KaKARPSWqiQRN0cw8wwn
         CRyjkxldUHGv2nAPXPl6rANo6NAafG9oAIm6DCrQYBf1kuFYx7ZqaHi7u//kLOigUzL+
         UO68Ds+95XRr2NZHIbig9O7l147Z1vXgk8y6VVtba3aoSBTP+jHcnT/wbha6MJPMd2Cn
         O7OqNr8tLwekSsmavucM9Zlv9ENut9XuQvKxa4tn6+J2/tUzwaebCDkf8RBEnwC13LZ3
         sUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790514353; x=1791119153;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BkXSWtx80akFwCoBF0CHDjIQOF+Xh2PE8+5HXZlOT+Q=;
        b=pXOoussbi8OMGC+5lkqDWgUjPw5mXrvaNGBV4a4MpZCCgNsM1D3wpZ0ToWJm4UKvMN
         J2+HvQfQ6KRu2wIrMEB/OwMD9HFiKH3wSQ8akbVbE4+WDEhwFsQQ85n8yquNZQYCnqpB
         z7BcLpo+q0ulC9lLxN5WkLwq1Z20phE427q7Jw2MOiUOh7AtpijTuFtnD4pur+apGVWN
         6MbuTNwJD37mnyIdFQN+kIEVPXvgnVNz6on3/oFsALRGhs3RqERM5QXD4RaJlNZOFLdM
         NLfpxzvN3JqS1mL/g6QKn+jsrEW95WNZW2N1o/vGxWjlZLHJTPPWxfhCUxavM7DvxbME
         mR6g==
X-Forwarded-Encrypted: i=1; AKwUvBxFzhJgqEqXd/2Sp6yhqd3zyvnbQtEqOiKT1UJ9FAj0E5YLafJ2DuCtccqrz3ptnLO62pOBdhoCYcE=@vger.kernel.org
X-Gm-Message-State: AFuF++lQl/QotqOkek6ljz2/94R3cfgNvQL/S5g9XYTRArumvmefGgjw
	ga4GCuGPdMqS5rPwaPHwJKcCfQKo5z2hpWyyx87T9aZjVLV88N5xYIlPbsRSWPunPPOunFeELuE
	JCmExP/egAUN2vuD3a2GbN03nP7HInGnlvhOkDsG0IuJwq88AP8n+bwGwU44l4HxyslT0LSA=
X-Gm-Gg: AYBFou141XQoOUTYyWecp9Ga6vZ5fWm+zGqNMwoAgXILatx0IpZrjttpngvoMUeKVb4
	7vD8QrYU4dGBLcOBPm0Ki8Rkex2zhiGrLUySY2yWWAEGwEd/ULRbc1gmM9KHIl7rfv9wMHkhOAT
	fNRRPSK5jrNzuLRtpMWuFlwgOVUKM0NJ57z1O5nRvlsdbRSZc5c8oiqrloTgFm7omQFWgL0YIH0
	7I6AHG0AhWIdwyvWq4fQfgHKzakS9L0gMUdlhZuHOHwmZzwKgfBLbm20oLQIaTHwzlHHaQHUkKp
	xuomrdxW0NtLaKqXcnZxKf/8K277kZ1Wp99dff5sQvof112kRnPgfCzSZszCNxLgkUuIHByN6Kj
	2353iHe9z6vCagh0kyRZwTsXnFQY+l8Xf1CaTtKJFzw2bmUd3Oj49oK1UIiSXxSHjqgah5StUme
	lPmDt7HJLkl80i
X-Received: by 2002:a05:622a:580a:b0:532:d3c2:165c with SMTP id d75a77b69052e-5330dbe7682mr144377431cf.5.1790514353162;
        Sun, 27 Sep 2026 06:05:53 -0700 (PDT)
X-Received: by 2002:a05:622a:580a:b0:532:d3c2:165c with SMTP id d75a77b69052e-5330dbe7682mr144376751cf.5.1790514352651;
        Sun, 27 Sep 2026 06:05:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b580c66sm20204111fa.6.2026.09.27.06.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 06:05:50 -0700 (PDT)
Date: Sun, 27 Sep 2026 16:05:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
Message-ID: <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1MiBTYWx0ZWRfXwEMvRIp8XpJn
 amd7AAB1thLWWfyOeuCiZ3Con6+nz83u1STOzmHtWiNOGWFVn5x1CQjJXOaOIgE0k5PqqvFpLAF
 iLoDn5+ndqx0r9qZTK2qi9sZsr0RWoU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1MiBTYWx0ZWRfX+3Bbb68cFoX/
 /TE3BXHEIeVTYzNOoIEQNEWs6NP0QVCFo8eLsatmpYWdwDPpxxVN7l4t1ncZR501kRiyaP4x9JS
 q9jSfn2BjuTlXV5JuVevN5WTK+p/4gjCHG2Njg6HameKlqe2yz2P58e7GhkorrYxupIs6BjU9Aw
 GU8Yj4OeZO4r9ROPnXftjddbtyFZ/QKnacbankgLMCocoDbgvzovlqkOpFN23J0qZFfos21Jnx0
 iqlUMToE4hKKzJnxO2pibWof3Vozu3339wX+FrTuG5T83I0GgrP44/pcY3u3mi6uKj6sMK6f8km
 Mzqc21tolwohS59aQ5IXf0Nov0f31p2m+JTwMMeIDwMlhpn/GV19py4dRzRplkb/liTdcEflCNl
 T/SNbenu8VeCAMFgU+PLHyNpchXoN6OtaIP4YLU1Pe7XawnGIk7BBp9rc2d4CXb8IDcAFc/s5eC
 v0eCGrXmEWpyBFuirJQ==
X-Proofpoint-ORIG-GUID: 8yGBAPv_Sad95nXu0GAXMB7qE7vpa5uQ
X-Authority-Analysis: v=2.4 cv=E6xYNqdl c=1 sm=1 tr=0 ts=6ab914b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=MMZBmsOjQwISAzkKN4QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 8yGBAPv_Sad95nXu0GAXMB7qE7vpa5uQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270052

On Sat, Sep 26, 2026 at 02:40:19PM +0200, David Heidelberg via B4 Relay wrote:
> This series adds basic USB Type-C support for 1st gen devices, covering
> configurations that do not require VBUS power (e.g. devices using
> externally powered docks).
> 
> VBUS support will be added in a follow-up series after this one is merged.
> Supporting VBUS will likely require refactoring parts of the SMBX charger
> support, which is why it is not included here.
> 
> Tested with an externally powered dock station:
> 
>  - Pixel 3 / 3 XL
>  - SHIFT 6mq
>  - OnePlus 6
> 
> Tested with an additional, not-yet-included VBUS patch for non-powered
> devices:
> 
>  - Xiaomi Redmi Note 7
>  - Xiaomi Mi Pad 4

THis is very interesting, as it will also unblock DisplayPort support on
devices from those generations.


One major comment. As we see, on SMB2 PMICs parts of the Type-C
functionality are provided by the charger / FG device. I guess that on
SMB5 PMICs we will get the same problem once somebody tries to implement
additional charger features. Would it make sense to rework the PMIC TCPM
driver to be a composite driver, taking several components via the
existing Linux interface?

> 
> Credits to everyone who has contributed to Type-C enablement before:
> 
>  Casey Connolly
>  Zachary Dry — LLM generation and testing
>  Max Furman — LLM generation and testing
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

-- 
With best wishes
Dmitry
