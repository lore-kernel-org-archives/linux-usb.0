Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48D1503BD1
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057719; cv=none; b=pk7m0YlghRd+mk5Ffh3oEDQbLnojWbp2k5EF47qybKyRRBhazq6t8vZFaXlHtzeuxdKmsCIQT9k4YHCbUGolYTv4SC3bMeYlIMVQ5rpCeXvikUT3MBfoixeS9ucLtyrh6HdSmfjS/JQR5DlXMkqZwyErEkoJtAceZk1nFY3sMdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057719; c=relaxed/simple;
	bh=mu3+8mK8bt/N7Vf81iCNfZXtMLQtZd9goZa/42x+XVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPX3x0bQZSi03uHtI9tOiQ4PilkNxJ1bBbxSdH+3By57lbfCEBcL2xUnmDRCnx46XGkZd+aQQXT8lpy31bNuLGliFxn1oDpK/mtS63izcfnG4VNU2bF+s5wFXlqKBS6kGbhOCEeH5I0ttfWEuDFpIgcBSgS1cWun69l75jHR5og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYQ2LI9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TbiGrcw/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYQ2LI9a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TbiGrcw/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jfv01955711
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 09:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3KAG7YDGqOBR2D8Zn+sxc9jTExC3PMBl+koNYY0A4Q=; b=PYQ2LI9aj27depOZ
	qeweAXNBoA1cgejsFBYuNOalTEdQi3dhHBovBh4X5s67yygNgxEewsmXMGVxJwUJ
	xknMYhgUc0U7Sl1gvwmfoSE5dAGNJJuDkn+GDtdTh7un98iVQ654iXublSoIG3Sg
	f8/PFJQdbcAqm40e55coyKkeZVOK6GRgywvAcUQXGRBcvkXlnuBLxfiHkaHOdsz1
	wmwCWbaM+/YW1xU8d9Nq/H2ax0JHCw5413mffdzYSGHYgbysfsd7RDtp7UYVhM9L
	wNHziNWZ6WJxj9qi4gJBZqjatGt/8HL8VCV/ZVmkfN3Qytu6KTQuq4NVby86xgfi
	1zT+xg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdet753-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 09:48:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53391022d8fso11551671cf.3
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 02:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792057714; x=1792662514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3KAG7YDGqOBR2D8Zn+sxc9jTExC3PMBl+koNYY0A4Q=;
        b=TbiGrcw/LYd0JoqGg8EGOu0mGbBag4NQ/vtfhXszWqwmpZp7n/8B5eCQHzwYdnYi2R
         8F1IVCE7JG3Xb3rAzTDUxHsNOGImrPw3QUQdFNcfDWZXtdu6tgeE8vprNv6pNBbYQal4
         s7fDHimnE5xbyA/WBzX2aWXdjlNvkPD8tw4TgdW6nz8pNm3LybwYOb4x0UwXU82duNbu
         UIzoFaKbYoKnnbhwoUKVhq2X3ipn03nKMG7MW9KZwS/fBqwhbCVtgO5aqy5sDJgTvtDM
         Z3FHPDX/dTvsQucGNKbkTzsO1CmtCLY6mzFOjHPHGb1vnbIWdnUdbU2DhLfPzNh0yPWf
         P16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057714; x=1792662514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3KAG7YDGqOBR2D8Zn+sxc9jTExC3PMBl+koNYY0A4Q=;
        b=h9MO6HfiRDSQM3aMe179MeeknLErr5OnE/7kL5QDikwZSBEVC29gDYj6GdUo5lTYVb
         iSkKOscCIuB6qHcdBSEOR+/vIdjjrhvIo6B8ez1szrFn5I+Hnu3sT69nRzEoLwiMW5cQ
         iDh1a/tRn9ju7intUzNpYPtovJQIBS1kPAkm0ohpRtmJaWBzw32bYiJ//aPVgjr5GCSg
         ue6iHxRDjmS+QnExVFE8mDyIiIFSJGRdZ4faIvcJbR4c/VqhAmqqgmF/DFmYgFdRVKok
         aFs+Zey0NpvKARO/AGFB2JhQE4lXY21HMmUx+6FPPtT2kiWOeg4xgYHY6MEF8J2f79/P
         OgtA==
X-Gm-Message-State: AFq9FYJcSqBb0bONsW0BdCmVebel4XFJwkkCPeH/i3KjeAXqIfk+H6GB
	+7WOJlmXzRP7X0cNKl9GseJuwcLUhOnWprsRdx7v9INBv/GMajnyVoQsMVmeBZnhqXN9gqE8A5Z
	0n8/HPja7BdTWzF9VgZNHNRqcrhLQpIcMlnn8ve7QpH7lT8cThDOLOWNBETpZh8k=
X-Gm-Gg: AYBFou0i5emIIGMFtbcYsmvCKh5HdeKS1e6d9I3BIqhXMV+zCn5NR/4vv67eVk4vSnP
	Nl1afXrcFigsN2YfeefuWkuZvUxS4erJAQjOe8LZrf/xn9JSdA79D+h23/dNN1ldQuKaSaKzA/g
	iVTJwhvlMJDNr9Jc70mz85pTybqwXHmy+ojcSrm125FWuyF6gz+e5ZUDAmF6DoMVG+cnFC3EomQ
	8OiIZ4cYgLDPcbagtJTQYD4NoNRzmZiC5X2nL0IdwtQhfxMF5M0uNm7tb3PfdnSO/xk/oroeb3x
	4dwP57LKTvjSPEy/UE44hwWXEK3vKdoKldRr6fdpIB0adibvVLYZ7h/6ogghqGBwZU5vXbZB6YP
	SHxQwH2//Ka0wpwjqYMOsBQ==
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr356797821cf.0.1792057714041;
        Thu, 15 Oct 2026 02:48:34 -0700 (PDT)
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr356797601cf.0.1792057713501;
        Thu, 15 Oct 2026 02:48:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda622246sm102601366b.70.2026.10.15.02.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:48:32 -0700 (PDT)
Message-ID: <812d0272-db2a-4dd4-8e6c-e66145af2db5@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:48:29 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Use DP AltMode defines
To: Sebastian Reichel <sre@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-4-b657c9b6e4c3@collabora.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-4-b657c9b6e4c3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0a172 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=C_hJBzH1aKR8969NbtkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: 3mtoCyKVo2p_-8iAyihwFHMDLhc5tvxs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX0QxqlQzEvMn9
 MWeahCEXDjd61aRR3vzNxsazJfwNd0TggpCDW7JXDva8kcNQXvarQdwownCPIeIAGqbDF5F5S0r
 td3AohMG6fDYwIS7Ho9FfofjVJq8LAM4UNS2ulNHlMYiK8eWr+PFt0uo7/KSJO1jeMvRSuJR7Pd
 RsS0ZQUUSUaDKwCPJhKXEiYROakpT3PAwQt2eOEpUAghF7g+os/14f03X7mJnVJhn2eB3wjI1Sv
 Ih2P6lelDLaZ+t9u3usat6jWFqfoKvcN11Erh9a+bPDZm8hAld8YX4PC5anjLQktKJEK9fIQzW2
 vxJBIpZkOypEJJ/1XHAxxAisv1LAcHBHt+UMjRcl5HZlXz4/kT02dZORztxfvrgs7qWra3rXVZW
 5XDUNrXXf4gDF61fKlI2fmhFWUKPLtl8EKu00tyNFbg75MpuA8/p4q82XJiwWk04KEU2XdtaHm/
 v1a/leBJegvmjJzUP1Q==
X-Proofpoint-GUID: 3mtoCyKVo2p_-8iAyihwFHMDLhc5tvxs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX+lWx0sOhX3DB
 89EY34vEIv1crzypZ0OrMe+MlK6nJ6l3N17toKzf2L9Ffd/pMGqGWNjdtJBseZl+w+UC+pkNrcY
 pMgHT2kj1DyiyVC97OPUbqWWUVzDKkI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150038

On 10/14/26 11:31 PM, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
