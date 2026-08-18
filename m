Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214543D3D14
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048246; cv=none; b=htuI8MoHMM/1zjzKuNmGQRUaSrvmvTVY2bf7cXAtFkVvBUoyctwi5ROdakQZH7yePuqwgpqk8y7JJRc3vDMmbpdVYus1gjGwFrndV65U5YtFiPaDs2w6n7m8324UQhU1bEBbDKadTVjg2jpzDcbPg2edexUk28wzrVIQ3tZDTKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048246; c=relaxed/simple;
	bh=3La5q+t6nGhdvaDUpaFeU9Yyua8qQeYslPh1H+AySuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUNp2fUaXM16Qhdsp7ZZhAIXWDr8sWF7UcZ7bnB4VXk8kRykZ3E28JKjEgR0V0yeYaptyI0KfGZTynV0K95Y3LBm5YJwGm6qd5JtGeb/0u+Hfe+sPzxjBAnEWaqNVnpsG5JBRZMKb/QvvSAedgCWuJ4dU04pNI+8l51Z0My3APk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEN7wH9S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vx5CtWa1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEN7wH9S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vx5CtWa1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABiXV599463
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 10:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0eZmZ6af1TsFSeP69im9Q9imlxUhyA4Ib8fV+99bbJ4=; b=kEN7wH9SygKAtVlr
	49XlQ8Dz9TRX7SfcXJzIJFs9ktAy8YMJh64iueMoc6t8DzPiUc47PlTpBTFeHafi
	YmSGpXwQe+e4AEuVFfGT5cxlXDruxZUZtBypx1tmzGg0hdlUWRUyBlsZCFaOv0ok
	k3AdSk6oZy7Sk7dDH14B6GtZFy+0QQDneeB+xx2ptPt0NF2GrnGKtjHTlGPPol3O
	Bra05fsSaJ9Jnn6kFcm+n/nr8ax3J7lMAI2j0Id0zHixK1vxFZFVhtjmDdP9V12B
	0oV8/QOomZHF0hYynxseEuBATAz4pGhbHp34lY8m36Jo8MBMgHa0GECcC+QVhsHO
	APAkbg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtstmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 10:17:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936cf9b6f32so31584485a.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 03:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787048241; x=1787653041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eZmZ6af1TsFSeP69im9Q9imlxUhyA4Ib8fV+99bbJ4=;
        b=Vx5CtWa1dwmNSSX+5ESjVkFADPcu0AnfC3RgDWoMoTutmhYtIIJz7WNErI7a9cXeAA
         vAZtbsFQO69K4N7YEnn6oY/TMgu+wr65SimhWa4vFMfvyODZxyxq6YCDg8Vie7hkfClF
         ui+cAuiB9RNe7TkE1wmull5EZqUF0wnDTe9ybWpcjZ60besxfEEK6tQ4SVXtP97UBiWc
         FMylWfSL1vxX/2EAyOA0iTnhEG/PKPL8s7HxmJeVRDVI6BIxCiAAlP6bPMrOTpQC1MM7
         p+NNoiej40haySiFIUcAvw9ysWOZZEtjbnK9on7hUOJdaOJSX7LOEYUbRqM2+/Pbntga
         c2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787048241; x=1787653041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eZmZ6af1TsFSeP69im9Q9imlxUhyA4Ib8fV+99bbJ4=;
        b=KEKeetgVVzVwBWxbIATl3cyZPAmgoyU+zQA7fXPR/znDjLoR95Sql0u8MY/nWscdqN
         SyvzVLBEnkT7cnhNgz+Ssk2Gd3aBhXOKbqFAG+b0M9/v6LkkHTW/PoHqh4ohreqmrLC7
         hHocMK3Pmahwc+AOGLuKFcg5Gqi292XiQLdOb/cBhoL7KcQKu8WOVrqxrLO5Gy7OTJ45
         hyxSQ/hdnGgicKb9tVPLAzSOPlGPmyTvOI5Djhb7dphWyb3RKuJeooqFZWBN8LtzAPdI
         SAj1fkOxGNGz9DTQRmeYN0Q5cRBBVR/GL4zxaq/0pSOo883+l7R4Z4P1RO2oJpATa+aW
         D9fg==
X-Forwarded-Encrypted: i=1; AHgh+RpQF5CY9vDb+LDFEd3AEvwbvdcvr94TIZvIJwzYY/9hiHreZ79Lz1xLlLQW2TtXve+YCrxWyx1WRjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLVx/TRSf9Lg18FFyfa6zmgwiKSfuG/okyfVCG29yZVAWXvYJa
	4S3iIwlpZzspOdFJWkPzp3sXnY2Y/wxU1fmD3cjzxvalAlhvc+w4Oka5Zb9yegFdQ9hzZwZF+xL
	PufpSPQgZk1Jy57X8nIPgHa+2YQU3uNM/eyQk0mNwWDh1VZMElWNrxySj8rcTq0U=
X-Gm-Gg: AR+sD104spv8KmFZloEeNOkNMJwSMeeQxX3/DLum6XYukC1HDAcqRWOL4q4mCjHgFNY
	hjb25QTDZJNXuKnuMVYWrFhseI7hTyygCj5gTIzdwx4Q8ec/xTVMVEW0GnbhIelV2zHwtuUFx7S
	+kjQihBVG0N34EilhWaiMaeTwFQa+EUX7yY9WYNnk/6VrCsa0OEJMdtu/o+bNU6j65KpdnOLE8w
	eeAzRPXZDmx1cNR/UvGVmiALgAXFMOjXNq6nCIG4/aagz9y6MUmupgqOxZYws3ZrkjulSLqkMCc
	S+emL6MZSkb7f2A6bN2Id6rmqjcH25ixHgp741eZnnlyd/p26Q3K8kosPSkB25GBdDaOvT5BEAl
	EQmTf5QAxqXCjBsUOkzxAjt22
X-Received: by 2002:a05:620a:800f:b0:936:5ad0:fdae with SMTP id af79cd13be357-936d23c8621mr2530519585a.4.1787048241557;
        Tue, 18 Aug 2026 03:17:21 -0700 (PDT)
X-Received: by 2002:a05:620a:800f:b0:936:5ad0:fdae with SMTP id af79cd13be357-936d23c8621mr2530514485a.4.1787048241143;
        Tue, 18 Aug 2026 03:17:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217ff7e231sm164193566b.20.2026.08.18.03.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:17:20 -0700 (PDT)
Message-ID: <f569cf08-408f-425b-acb5-3d56fc534573@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:17:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] ARM: dts: qcom: apq8074-dragonboard: enable the
 HSIC host
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-10-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-10-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3NCBTYWx0ZWRfX+hjtQBY64NGR
 QtKGa8slGI7g4BDqbZqaCqfxxjq2SSnui3UP/mwqswVeWr7rBIPt0Ah1zt0RdEceobHLCxIWVIU
 XnGAbZ3krdXK6v6iOwoI5cLCjKQxSSI=
X-Proofpoint-ORIG-GUID: F8f9Vm6whBj_2Ujrat_J1gg6QQBsWwYl
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a843132 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fR8JJq69IY22NewaCa4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: F8f9Vm6whBj_2Ujrat_J1gg6QQBsWwYl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3NCBTYWx0ZWRfX0K3M8EZ348Qt
 OXwojW9pChPRYFS+D351XtOVjfU2Hfaju5nd8OCdPSag0asu25rowf/oGO3tau5dajjS9MiSJpG
 uUA6stYCX6TSaTWS7WGZKHdi0lkI7rtni5lm6bkrSvJMvNpwBo2Yiox6F/rocClLZjN0e1DT2en
 JzaFbNUnkM2WDL9Aij9zFqOw9h6biZoQusJ8obwIOZRVdwEJPWRhitee4VbYo5Wpp9Xr5DglC0A
 Iwtw7YJxACLDTrXhRH0vbqf0vrU2BWUI3WbfTrfMUG8n/pKdfSiSbZmGmMbRRn9fe49R9EgLP0f
 Nh5jmvc6qOxIFSxh8wc3SZ9sVX1jqdMmXQWdwGWn4vTUbT12GX1wYPcigOp5JPdp/3ffTs3EnfP
 V95kuG6uZXETXGsU+omaTbsgQ/1fscDZRWko32AZDg3sALzRj5tnv7Vz159I8o4SZIoRdSMQNO7
 zgGfNys9yhuHkfv/U7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180074

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The dragonboard carries an SMSC USB4604 HSIC hub, but with the HSIC
> controller undescribed the whole HSIC-attached part of the board is
> dead.
> 
> Enable the HSIC controller. The USB4604 hub isn't controllable through
> the I2C because of the board design issues, so reference it as a simple
> USB device, describing the reset line.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
