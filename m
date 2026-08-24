Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9164140EB9D
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579083; cv=none; b=Qopb2T+edZx2EbdFX1m8a8+1AttPJZ7fYh7hLikhQSZ4u3PBN0Ti/+/ybdxQ9jgZptZ4faIqBFVpJBBEpJP0QOED91RLzAUoeLXGDnvE5y+G2LYwMbu5s0cW4vojjTg/3cm3rdkSEgq/3P8a1LYP9jUJqNyGS2thgCrl/CzPUvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579083; c=relaxed/simple;
	bh=hv/JP8KtSbG5GQgDD9yQqGtkwO9PPFQFjzg9Nd11E1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p4moqzTiBQjHRplsfb4SoL2ijZBPwF01Lf9+IgJFG0mw6v7PV9lRKf1OxRcXjodIswK5SFeqW9t7HNW1EYebazNIab1Soh9qRu5Z86zxgdm3R0SUWNvXSPN38eTu/WdHAqHBsLziv/cWVPuvuB/k+j7RAIubcG+TuQTFbvTpzVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwwZxt21; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8r0Zoaj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwwZxt21";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8r0Zoaj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv16A2854131
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 13:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LacD9V3RBfY2cXXFYkLOfiCCuGzuDZ67e0ihEQlRc8c=; b=KwwZxt21D3myEBAm
	7DSZX8i8f0fMaPlwsDRkV8fx9kZ2ZROElB13OvNg4neVfR4vswEuzbtke7fOs0JZ
	GcgCVqqzDEPprFEGJCfXkZXjYw99FdivGdY6ZGOeJgYD4JpUOLzLarWYuwYu5smB
	zAsCj2DCR56DyLGV/CL9OaPK59bYAD1ov/nbXd1Ji4ss3cTuKOS90wWT044pYWpg
	mtCnaNt6RHKGDsYjGIC9Y/Sf8RAGsW+beqGyIfRpX7arTWj4BjxL8YIiDk/Io1Jy
	GE9HH+aFvTI3sWxh6IHNkvltdPsPGtaQ8YBFR366fypckhMla48UUZp9R+J71KlL
	Pt4VUA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn9s8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 13:44:38 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97c3746cd0bso45059241.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579078; x=1788183878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LacD9V3RBfY2cXXFYkLOfiCCuGzuDZ67e0ihEQlRc8c=;
        b=h8r0Zoajedv9kyh+8ujt38E3Neti5hAd9/HCNHJDc8dDj3ikzVaY4Lb2qYtbEbb1O8
         4v+dJz1qMIIAlYghieb4zhUwGWDTIJlssIpadbFaqk0OazdK6hiYkvAGisc2iNGDHAJG
         sJO7fBsHr42/OQtiMRyqXMEUn9pYd5jH3ShoSzd1CYdlFimqm+MKW7F5Sj8E8+qmkGxM
         6eZU8sCRclJOndeZWhbGWo0S6g2Rq2Tk4LrLaj8WziUopOxFh0CklDul7PfNGShlbM0O
         4XHOFeD6hrhpdc5qC2zq4MZJ5/WLSzMgIoFhiNMb6O0YZ30Ywf6TBMI+lUY4N361mHfw
         hyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579078; x=1788183878;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LacD9V3RBfY2cXXFYkLOfiCCuGzuDZ67e0ihEQlRc8c=;
        b=UXrYwA9VCAE3IiokfP+Se6xs4n7z5Du9F8BeC+71DIeyoYvKEawtKXS2eckSGU9Zdz
         SVDrYr7tJW5Le7HTg8uMrohcP3v5ZJ0EcMXYn2PHUSe9xCSqST191pPzyY7vfQhTGTFG
         TvAuJ8dYIHm3ENjpKt4tGC9GXSrvPYu/f9ju5EnHYiO1JunyJQyVWBouA61hS0ISdzKS
         GVmKRqSXeCEkwZ3I4uJxEWacClYTjKQNImeSbluE+HnSAU8QVDYWfq/ZakgF1eFxqtsG
         VEsxqrroE7fhBUwkRvfEda9NnjZ2LdJ2WPfaN8NTLUI2uDKDXWoMuGrYPyfSDruPOJI8
         O53Q==
X-Forwarded-Encrypted: i=1; AHgh+RrwCOhW7T/lC9Bzkdwl8rXHGUx2sAXFL36vunjwvYW+GNq89oMeLBnBCnoJDwrBpBxNRzOZABCYDFY=@vger.kernel.org
X-Gm-Message-State: AFuF++miygd1p74vQUTvEhfvWTx1YajAGwaJUI4b4DOYcRVYtvP+m3R1
	vD0fCPAJ4OM1Dowh+5/5q7lMyRbCrByZUIfydMqjCOXvdKr57RBbl8NW48b6/YbG1cRxeMJQIPH
	idbDthWbFEf5p0AZf5PXdyiBx9ydO7InfBgZdjkJqvikL3zOr2GMDckrXKDatEio=
X-Gm-Gg: AR+sD10Mza0iok8WOohviFiweM4tQprdNhkQQqJDxcKeelM0aEGsDhY487L8U5UjVdc
	Io2fhpLmQKHa8p1/JL8Dge6192ALuHXseDqdB+k1a8GVDgUXW08ZyZIcSM6p8MSYGgt7iATrSdw
	7d2XFFtbJpZy7c0LfPJ0MvihuU/+xuq7PIy9++O4s/4hBFqpFnxoB5o8tN5neX4at0bCg2G0u/x
	Hqbd7iLAYwap7WHBtkK5XkFXTfSlvu3oWyyYSurCo9RphrueyL4qOVXFQIYwSMIzeB6IoOxAKMw
	5W/KpuU8AoyC5WL87jp7BkGaQc7G0lyQtkSYGuqkz3K3B1FK4JHgJRD6YQIP88cDsb3oBSGHnGc
	OxdHDDLKQvcRNA6K8vPUV7lw9
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3943898137.0.1787579077830;
        Mon, 24 Aug 2026 06:44:37 -0700 (PDT)
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3943880137.0.1787579077333;
        Mon, 24 Aug 2026 06:44:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1aeab9sm10043455a12.22.2026.08.24.06.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:44:36 -0700 (PDT)
Message-ID: <c0215cd9-3973-4306-85e9-d58674d6bc83@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:44:33 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] usb: misc: qcom_eud: add per-path role switch
 support
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
 <20260811213610.2956147-5-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811213610.2956147-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfXwHNcHs6NyaUY
 /OHEKK8dE7YQCEzomWwyBIE0MgYdtfj/Mr9cqCPzHK1GKNWCTF3s6bYoAbnpKuGGtFvfECs7ssq
 pvMUekJxWYUESpKWUix3wrASr8d8Wuw=
X-Proofpoint-GUID: Mwo3nZm7eYewKFyGRVlmdM5pyIuMJFLo
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c4ac6 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=zBKxk7NNTVBP4RM8Aw0A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfX641s33PqnYpe
 P9mQL39EnzIE8okhrALAIVsTlepIVjKwyuxZDESs8zpHk/5d3N824/U/tAfgYVyjUW2CgH2nA1x
 le6exyqSWPA/Rh9qwDwmEYBNG8UfilFgkNJNzab94QFseL2tvx7WqKnirOyFoRJC2WNB3gpaEyu
 psKXFyTOzBHQTZxEJEf78z+E0tn8C/oSz89LzdLuNQ4VDIuApjqPU3IJ8VhmT1gStmdFxJvFeTj
 Qv3R83XBLdTbZkngEWIMimY2y2eRoBc7XIIHvrw/to3PSRkgNnN203eT1ELFJE01pkAzPwp4YQ+
 piCgik/FwxfCOPZ/CeA0ENk9/OulXXub/jOEMzmw/2vUIkGz3sY/jBknJM9OOCouNh4ppFFyXRq
 OfE1E/EzxxXlSQ1heSX9ywm/1pGm9z0mJ2FBwvH5SgE7to+qcWwfKMDoWzvtscYYPJIMrU3+PLc
 Utk0xnH3KWQIr3dT4ZA==
X-Proofpoint-ORIG-GUID: Mwo3nZm7eYewKFyGRVlmdM5pyIuMJFLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240115

On 8/11/26 11:36 PM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.

[...]

> +	if (!strcmp(dr_mode, "host"))
> +		path->curr_role = USB_ROLE_HOST;
> +	else if (!strcmp(dr_mode, "peripheral"))
> +		path->curr_role = USB_ROLE_DEVICE;
> +	else
> +		path->curr_role = USB_ROLE_NONE;
> +
> +	/* No role switch needed for fixed role controllers */
> +	if (path->curr_role != USB_ROLE_NONE) {
> +		of_node_put(controller_node);
> +		return 0;
> +	}

IIUC think this is a bit of a convoluted way intending to say:

if dr_mode != effectively_otg
	return

I don't think there's much of a better choice in APIs here, so let's
maybe just do something like:

if (host || peripheral)
	return 0;

directly (i.e. without making ROLE_NONE the "desired case" as that
is very much not obvious)

Konrad
