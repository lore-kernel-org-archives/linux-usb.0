Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F34DDC5
	for <linux-usb@vger.kernel.org>; Sat,  4 Jul 2026 00:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123548; cv=none; b=ErevuDnpDE3nZorO2doPNa6xaxmxHiyPCwTsBm08vOmyrxq71/TKboxcYkuslXsMUlxWC1v83VJGRdcNrHDi6JD71bduKyqzYCGP4ErAMM/mmBttOb6Csrusa055i6vd3a/Wh73UAgyEfqFmrg0yEXjTUIIQAmmsVjTOiOLIoQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123548; c=relaxed/simple;
	bh=HN5m/Ky6KNrB4KekaPSsiduEjRfi7N8uh7rqA+cNKXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnO1caQSh3X15cr53hERi9r/JCVA5FTW882IhHMkz5n/ct/gKebSKsOjvHvC53ej1qyv8FJMj/TQQL+/Tk3medCK7JHx9PGIRVvkmboESqn/H4EJwCqWe26H0nGM9MKGClRswD6ci94HaeV3fDj/iJn4VsEevxFzT6tm3zqa1H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUlmcldW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/w157fn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUlmcldW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/w157fn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPZvw837911
	for <linux-usb@vger.kernel.org>; Sat, 4 Jul 2026 00:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kHuhyQoLRKepVYyh4wYVN/ur
	TsPJeX0lcSSiDWnFmtk=; b=cUlmcldWNjC6I14+UZW7DjVLenDeTVTZxGNA+J7a
	2UJyL6OsjBNtIWKAPKqw1HJMbuCeoWps9IzlqzX2kp7/PJgvR4q8OyrVCZHBrWYO
	rTNvItIVVhWsabVqe8gfJ7qErz+H6fTLgjbCFLMiLgiFroJ8urWVp+NnwFjWHfir
	IlZnXs1Fd+Ihkv83yvQo/y2xZwU0ql28/kP4n5y2MiPzFx4iZHZWwXN5LewnZpTw
	03A0bzqUGCRE9Hhpdq69V2+7z4VdAwhp47d05GGetBdCPHE4L9Z9QIPo8rWByZ0I
	Xbg6IyP0QCc4I06SmUngtv7vLlE/dT9gKLZut4a2DxWsjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyu511-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 04 Jul 2026 00:05:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e538afe65so104418685a.3
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 17:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123546; x=1783728346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHuhyQoLRKepVYyh4wYVN/urTsPJeX0lcSSiDWnFmtk=;
        b=G/w157fnjuqpwr2zBE4ckAq/x1lMaQD5MIsF/F7293zzuCcLskRcuE4L6n2IyWEhHY
         D/cT9BcKDVgaV6G2INOYG+2QcbwXfYLUtMILRfZ1pheE8UgYpUaBUzaanFlwv2C/Xk10
         3t9je6wYo7uGzZWhX0GRqeXOXP/o8A2jru7tKJTNKUcU1HAc2790KAR6fmfCOAUnazHa
         0hGnojeOQ6BkkU+fyZaq2zHqleP8Mteiq6a1AUdW/OnjDrRgRLFPi5oMMoI9VeJxH2Vh
         qikd+DST81SmsheuJ2mb6i+Gub3wOT6yZAjuT37VlSSiLoqjLuoAFjwoGVV0ndYxHj4r
         m2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123546; x=1783728346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHuhyQoLRKepVYyh4wYVN/urTsPJeX0lcSSiDWnFmtk=;
        b=pYksWftueC7f9VNhZOO3C1dCq0P/p7ZD69hsSgMSAXcVbliq4q34NpyJqOnXEGKNlI
         yD5QP94upe+S26OMKDfH7TJU5aBRGEs4FM4KuY8eQ3Q87I7IU6cb+S9nucQ/rZRzt4wx
         bZ2Rp4oSoMKx4+Qu9f3niORsOa+OTDUHuvWcda6yF8v8LuMgC0KQoYlG8PnKCBy59wH9
         pqoxLDBNoyJxcI0EToo2vnaFSSkrYunJrm7schb+ATb7VtU8LBiM69cSAAHDhOqobNS2
         zbiaAi55eawgHC5vi4ZYBybo580s6cUQPa/ctPQkAlvPqxe1TIowD6+VWD/wS6hcBhAP
         IdZw==
X-Forwarded-Encrypted: i=1; AFNElJ9LqUEy1j9vS7qIuXBN2es25cbnkJlXvtl5G1Zwo6qhM3S2Q+fp94I2GCUmb1UB1s5tUBPmhNfb8+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0it4wclCAn+AeTL5yAHV2/mp2/28IeDApoNcAqkPuK0QLt7oV
	hXaJ3EWkD6zLMcMSYmgOHuc0+6x0WLV1XtdAnnqpIcQyT1gnObwQ7b6VFh2RMKVmiR3FBg6c9Re
	Jiq+rG840JldpvZfeeJDDwYv4Cb9smk+PnUzfYzjAMHIxT+JWV7e5keHTskG6wJE=
X-Gm-Gg: AfdE7ckA3L71LibRIcdHDtwYbczTYtKeEOORUJDgMcSX44uta1mf27IAxPcBU0vbyxI
	s5kzkWymE6Zd202ZJF81mVDkzBoADTH4WIxvTfNkUSfDs3+Imy4UOiriOFkUlynRr85zM9lD42R
	85ROnyxQlxnFu+c+3I4Oa4NIMXROJPzPI/FLTvSm+1PoOZkJrA9tQFp53XqOjJgUabkZfrJsL29
	4ScZmj2Hd6g+Z/j3YU780pTaXQz6ZDbpEOHvWJHJakJ/dYWJtBZF1L74f72fkqPXb9btTO92Xed
	9ResEHWeRedyOXX7adHLrXtEn56QDv6AUVAQo3C+2QwbRkuZAM2+CD2hX/L33kuJQ+vUtdV6uAW
	2QtIafvaSjTJjPA86TOaxIyTnnZgpnMzZpPGbg7z2LDHIiOo5YFcq0BZm0RTvJrxZ2al8Bi1emy
	nOEGGkcWiLlRUuCM2gSXGsiAAU
X-Received: by 2002:a05:620a:1723:b0:92e:6e55:cc66 with SMTP id af79cd13be357-92e9a4c58b6mr227038685a.47.1783123545572;
        Fri, 03 Jul 2026 17:05:45 -0700 (PDT)
X-Received: by 2002:a05:620a:1723:b0:92e:6e55:cc66 with SMTP id af79cd13be357-92e9a4c58b6mr227035185a.47.1783123545010;
        Fri, 03 Jul 2026 17:05:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377096sm843872e87.25.2026.07.03.17.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:05:42 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:05:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Message-ID: <cwc6a2d4fasizfe54f6yvpgzkczbygjzkcoo4jlnn6tjaw3pei@m3py42bcnooc>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfXzdj7+yNQ2yM5
 TFWVBZ5pwMY6na2oLK2lIcQfmm7dfJPua3pJV4rs0ycaLV1QukUO3WSqyAoXdNhfkgxPxdYeCBb
 20jC9xSpvDILJWn/30zPbTQQqNIPVXFg0HAJEr3/RI0ZHaFfQP9NbF3K+bV8jXVENH2YU/4SUDY
 9FEWsGGifPT/kfsD0yBbP3SDdHMaiYC9F+BnigSNaN2foEtiA7A+6I0BW875jrcvsqSXdIzgHwV
 CPI54zO2LCaFQW4jLKtgkwOAlHt2zz12GojDTZm8NG8SH+VUXVQ2ROdbFMNbY7GSYQSOm0xgK0d
 p+dxykN0liTfu1H7j/NwxRrxN1TiB0cI8e55rIZ/Eboy8YLVgyx64nBeaCokBAiM4USSIFdlJFO
 BBIKyDMG+qb8iTy+aEQeP3GxFBCAaC8Mz9XyVL7ayEelWS8G+6hOQjqwJYQCf+6an2mTlwN7bl/
 PZbeuZI/VgJ0TYf4OIA==
X-Proofpoint-GUID: cS95QWomEABtMC_F4EPUmkXPSqm6Jbqe
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a484e5a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=9O-rVQOD5xMnlwKyy4QA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: cS95QWomEABtMC_F4EPUmkXPSqm6Jbqe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX6FPkixN20rLH
 K7MZFcBJrcl250zn0lKaMmp20ycV897SbDWRPW14gYezQBCmxhO9ZyoBgqiV1mQDhzSOD5mYE22
 t6J1wnBt5rhzn3qwEx20ZBco23kQpjc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030243

On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> independent High-Speed UTMI paths, depending on the SoC configuration.
> Each path is distinct, with its own connector/controller connection
> and role-dependent UTMI routing.
> 
> Because the EUD sits between the USB connector and the USB controller,
> it must relay role changes across the UTMI path. In device role, the
> EUD inserts its internal hub into the path to enable debug
> functionality. In host role, the path remains directly connected
> between the PHY and the USB controller, bypassing the EUD hub. These
> hardware constraints require per-path role awareness, as UTMI path
> roles may differ.
> 
> The existing binding models only a single UTMI path and assumes a
> uniform routing model. While sufficient for simple device-role-only
> configurations, this representation does not accurately describe EUD
> hardware when role switching and/or multiple UTMI paths are involved.
> 
> To address this limitation, per-path child nodes are introduced to
> describe individual UTMI paths through the EUD. Each path includes its
> own ports description, allowing controller and connector associations,
> as well as role-aware routing.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  .../bindings/soc/qcom/qcom,eud.yaml           | 55 ++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> index 84218636c0d8..21f75038a81c 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> @@ -45,10 +45,63 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: This port is to be attached to the type C connector.
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^eud-path@[0-1]$":
> +    type: object
> +    description:
> +      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
> +      to associate role-switching behavior with specific port connections, allowing
> +      EUD to manage role transitions independently for each UTMI path.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: Path number
> +
> +      usb-role-switch:
> +        type: boolean
> +        description:
> +          Indicates that EUD should act as a role switch for this path.
> +          In device role, debug mode inserts the EUD hub into the UTMI path. In
> +          host role, the EUD hub is bypassed and UTMI traffic flows directly
> +          between the PHY and the USB controller.
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +        description:
> +          These ports are to be attached to the endpoint of the USB controller node
> +          and USB connector node.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: This port is to be attached to the USB controller.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: This port is to be attached to the USB connector.
> +
> +    required:
> +      - reg
> +      - ports
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> -  - ports
> +
> +oneOf:
> +  - required:
> +      - ports
> +  - required:
> +      - eud-path@0

Do we really need a separate eud-path node? It doesn't represent any
particular part of the EUD device. Can we simply add more ports to the
ports list?

For example:

ports {
	port@0 { endpoint { remote-endpoint = <&usb0_host>; }; };
	port@1 { endpoint { remote-endpoint = <&connector0; }; };
	port@2 { endpoint { remote-endpoint = <&usb1_host>; }; };
	port@3 { endpoint { remote-endpoint = <&connector1; }; };
};


-- 
With best wishes
Dmitry
