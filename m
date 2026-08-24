Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB8B2D1931
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579295; cv=none; b=Zi2RxaAxMqq7R58ZRbsm78loi9xv0Rswf2PXt8KJXcKEjArqQmoSm0MxpIGUm2Rk3P78C3647/7C0YZw640qYrF0za6amSwkisl47cVz1CrKcfmdA8e1w9Zhe+jMWee43NxEelm6WuUef9i6PFhHQ5ZvmoZReWuHcnQzZwqhiuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579295; c=relaxed/simple;
	bh=jPTF8P88E8mHV7RO8dC+Aii8EkwMv2ZEjXFtqjGARho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JxA47TATue+RbspjGigYkopdaZUbksk4U563gKiaOffh/aKElqwRNOxJQH+zROTgUVkGPA+o56+86V23U79Mg3daOaqtGXQzXvI3evD9u8XvYPPvbsCSmZMOfymAhEJ7mm2EAgjeUyRmHDrIL8fblPinbdvTcfQylhRxunUwl3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbIm6a/s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TARNO0qM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbIm6a/s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TARNO0qM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OD9C7m3102782
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 13:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b15DvA52PT9M26T4P/yCzlhrD5TH9G8ioAlZEP03aGk=; b=EbIm6a/s+CT8FLha
	s+1ubSks62x9IldB/DhPKDrI8XUbO6/aqHt8GVhqEQwTAcEl1s9/kgFHLY9JMt0A
	lz80jGR+/2TeuNdoJRRhmjnlf/luIM6xCqH2XMrckbObj/jo0opB25+HZZrPedsA
	zjo7u/MQr60+SVEybQ0dt763reEFz2AVNnvxZj71x41fd5Vrij6zRLBeJ0aL8AhV
	ALKn8nvRXkwn8hJBMblz/skIyV7lraEWbgvUfOb0KgQqBabw7wYkgZsi9PQnrRM7
	+P8KPAsvw9ZhNgSL4ZV0ssrsfNNbxguB5BsnkBDODVQEyJdpuutTLb+aGr/UT9DK
	wnxHjA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8pkdg5bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 13:48:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso6836861cf.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 06:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579291; x=1788184091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b15DvA52PT9M26T4P/yCzlhrD5TH9G8ioAlZEP03aGk=;
        b=TARNO0qMI+qtwcMeMSmp3hYjUG01qp1FRCkNRuqNJHOtHFXPh7hcUQj+BNBe6WXE52
         9rg3/KvleVM1PN00wIiPqyZfVGkgu0OidTLt7ye+w6AjXqI1wgwF05hsHq1uDIl0ZuM6
         GzHEHVY/1AiD7PlADSlJjyQ+1E/EsNM9T0rIhhhzwi3eYORRB3Qo1PM0TJcPO/u7FztW
         zb2hZn387i3/ksbm23WsQ1ani91t6+B4+QqRBhReeCS3PPV1T3A2ezz7E3xdQFWm3w8C
         HuwHTlXfX5CYXM+2LGImymbIqBheCetmN8NqNb0E316gr7yrcUgxEvHKFI39KCzqlJ39
         xZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579291; x=1788184091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b15DvA52PT9M26T4P/yCzlhrD5TH9G8ioAlZEP03aGk=;
        b=UGWkdMqRaymvJug7cN9rW7juagxO4VoQS8R9qaVoq5RnJRqJFuR7NmfZA8voHvlg7N
         m/BBuU5wqxxlh/pF0f+3SYSUG2LDwTHuxzOAvVdU7firoyDJvbmd/E0kfdbnghYppPbb
         rhRzSYqLQubGtowdd4PGVdwbVSNED0vpe1ucdGIgFEZNtFvAnQvXCxvj3oArb4eyTsra
         xgvjYS0j+I3W+rNCEOwx2Le98rjx+o0PvZjVEHoHl64GXgautJmIz9bTMubZr3grvfqM
         /gfGHr7ZRje461XlftSZKKmrnSU0kooV43+avFJOD4lRH2plsyLO80abN2eRK1gGNEwE
         asZA==
X-Forwarded-Encrypted: i=1; AHgh+RpLsHLqfJgkA5zunqM9E2/TJ3T3C5lY35weDrEnmS2RvSwUY00Kz6cix4uxlE26VVyztbyaxNENygY=@vger.kernel.org
X-Gm-Message-State: AFuF++l9CvaPhlGfM/uhE8+MydaWHJwLyLSRrHUkowcqXoiocTW2G/ZM
	XyXy7C0uIpPXqksu5b4UK7vNAlzccLopeNljtuXU3oIFz5S8eHmfEFMEiGQ4dOZREz1nvXVX1+P
	U8W5/a7SBAZUArw+MCtzkDHg1cAWutW0KulNXlTzXC11QuDBZXMacQR8finU0gkg=
X-Gm-Gg: AR+sD13E69ZlVD/lbiEWd0+FbugrQ8tjFeaj1oFbr5oN0jVdupJiUONPd2C/pH4FwDe
	cui4C8uP3jTvc6UEGVTJhiyS6CHZ6x8NcTZSWCLyHldJR/XEW2jQhlQhv6f6gDUmkV6oiUaC7yJ
	gpuTBYC7iwqoW6fp4DsvI5TS/6PCuCAZe3ZTmGmVZdJ3evAsL+nAXQat14v8IUyLGQDmdoG5kRB
	Vtgdu7tUVWkXSVU4+j1HOjeD5+XF52LRtNf0QLZS6YhN8zfe37IrQqWIfrgY6CdRF1z0fyzs+9G
	KRjud9GwdANXwHpIvLwVrAbvcyLtD/oM/ZET9a5SLgxhcVBYSi3/LapvOzp8ok6WshZsT7lGu/B
	Nz3x7xmTwhTVgG3OSXutscmaz
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr186253241cf.0.1787579291203;
        Mon, 24 Aug 2026 06:48:11 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr186252191cf.0.1787579290378;
        Mon, 24 Aug 2026 06:48:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295627sm1224564966b.15.2026.08.24.06.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:48:09 -0700 (PDT)
Message-ID: <906db71e-8f2d-4ab8-856d-915ff9dfef77@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:48:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path
 using child node
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-9-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811213610.2956147-9-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX08ah25pltDhz
 UcF3ZHYntl0REWNqOmWiGx/JOpCQV3IMj0vNkdy+sfIsFLpjfO0zB9W2n2UIaBTPMnwaj5827z7
 NoP9I/jlD2gxMrfwXVsSBLFqjzCDA1E=
X-Proofpoint-ORIG-GUID: jcDhrUronetMj3ajs96PKjSWNqarfPQE
X-Proofpoint-GUID: jcDhrUronetMj3ajs96PKjSWNqarfPQE
X-Authority-Analysis: v=2.4 cv=Kq19H2WN c=1 sm=1 tr=0 ts=6a8c4b9b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=wmH-f_HW3IgFKAUD-FUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX4XffRVBp6fmW
 AZChrUg4B5z52sZxylyZJtmMH1Sr8a2mpa+rMF08vPYHq9gxdf3ocqdpwV1XCly9ykebiwTeon8
 XIw0Ta4zLHL8H2uYvO1EPwWFpkh6CaVwdmaLudONVKMnktkg7R6ex049YR7i+6PAEPVfJNj5uUg
 8me9lhVhpZcapCH4TuejI9vHoHKbG94IkwOaF8cuR6usNQTtbaB2lOz4lTcoogq0//mnFy4yitu
 btyGgz4hVKyfv6Wse/eba/MmuUqaRhQzKbxp7zNRkvPwX/kW4IYIzjyGbkQ2V4R4pwaITyWL++Z
 9a5Ag8GSPeGeU+Wly2kbNrSHhKI4x4k8ahsPUeUBBQxhO0iZ5DV4ke93yYPIQhLUsdIJQRwG0Fa
 J9XK3gvb3QUnThhnJUCb/LNe7yPKM1RwfHbGo9K3KMnU9/cQ6tyXV6JlAe3vyOOvgbQ7vVfKz20
 IrZIDmn2u9xTFNv1dYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240116

On 8/11/26 11:36 PM, Elson Serrao wrote:
> The existing EUD description uses a legacy single-path representation
> that assumes uniform UTMI routing. This was sufficient for minimal
> configurations where the USB port operated only in device mode and role
> switching was not considered.

[...]

> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						eud_usb: endpoint {
> +							remote-endpoint = <&usb_1_dwc3_hs>;

This change alone will trip "connection is not bi-directional" warnings,
as board DTs override that endpoint already


> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						eud_con: endpoint {

Let's keep an \n between the last property and the following subnodes
(like you did in the below hunk)

Konrad

> +						};
>  					};
>  				};
>  			};
> @@ -4989,6 +4995,7 @@ port@0 {
>  					reg = <0>;
>  
>  					usb_1_dwc3_hs: endpoint {
> +						remote-endpoint = <&eud_usb>;
>  					};
>  				};
>  
