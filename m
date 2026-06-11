Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD403CCFC4
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174266; cv=none; b=lfCJAoValQkMTwZ9Q5OBNS59W6KvAXOFbD91NIKNGhCaxyxhxHMYXQbwfX5SH62TMSMAA6yKQ6ITyqvbziYY0U/X2opIv00TwLyDMxd3ialzoEJ9iOdKx6zYTdgfEr8Gio9DbSEmeS3ZGMHgarjXF6Jx7Hlmmh8Vn78fxaHQVlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174266; c=relaxed/simple;
	bh=SLxDXjrIL6iecKw2dITuFW5iAt8aytHnHu3Mm9uiiRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdI6HmtaeAxfk2fpL3d4sggY/EJJ5cFGb7p8AIcjwwW2ti91vtops3rMLKp4vwACfeq79AfG440QrKK1KHVfX5Fhi2Or7arj65NbKfrEtMvWaYwA/9JR6AT9W6G+A4fpeFMjwFQnmUeOXY6NnRhACPY1AvIBwobQASFgrYsHoFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFZH9dgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXa9bTUF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFZH9dgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXa9bTUF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xSTX174190
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 10:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tSbZsTv8JdnJf8FsvcniqLT25i5MlPnJqdxZhssIRI=; b=FFZH9dgwWkxTBnGx
	8rLe5O7oimmieFnYnob2ZY1JehYl4EanRI8M/JNn7Z0Ui4IxilRYc3BgGY9EZSao
	wNNOOyjXMdbtvXrIvlFtJbivMgYm4xEZWPDNBv3XnXVr0RkMpw6i/mVPunBlqzKl
	DcvRPqQLOy22KZMmcsDaU5DnYNhfWQIOx2lGziO11Z0XQdd0pO+8H+OHi9t7fuKB
	AIoU0U5tGl9QNicb0Q9O//W2FhjMhkeEjJn8Cy9iCGDOYh4Clrp1IhQ6O/nBanpO
	dSZsku8gyTW7z/SbCEIMBihPjTzb0G47fO7dwDH0SWVuA9Xv+JzJjz4X7OnxKDiY
	DgNvTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vawpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 10:37:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5176891d0a9so19913191cf.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781174263; x=1781779063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5tSbZsTv8JdnJf8FsvcniqLT25i5MlPnJqdxZhssIRI=;
        b=KXa9bTUFS+MRx1YNktKFvubSeoEtGypvtvMLel/1VDPmfuVi2V4+khyAYY3aJXbejZ
         NBRUEIuSQvmiHquKXpJIoVm5RpYAPxOMPPwZVXrts8YfjitsDgi6zZXM6+TeeQVCL4DL
         uYD/qYgGn6H9TSf4Vx6DfcnuoWAl6WYWdM6iw+VjMyHG20UwrEjLsipu8tfVNwVi7bYw
         ylsjKXW0Z0QlgQj4dLE1qW9RzVGucyRM6pJ1yM4LLZjkKB7zpAsm3btH/t+qwlcgY0gv
         KwWl/NJG/RmjETb0Ib6mizbEP66meM0R7T4n16DspG28jnwIo+IyJUl85oYv/mIOyzVy
         +XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174263; x=1781779063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tSbZsTv8JdnJf8FsvcniqLT25i5MlPnJqdxZhssIRI=;
        b=bbmY7nqWlP8kTr3MobpiSGe42UiiwARi5sP5Sk35kLd8jyiC4CF5l31d7gKLcLv4aA
         7IKnaZesC9So6y7jL475enRIB/GCsGtp+ta6PL3/ZLxi5n5uISCy+XKAaczaWFI3PYFO
         okwObD5BfofEDldQmnIkbR5i1OeSFa08ksVzhlFgg6dkbak4gNtCziWcK33bP6jLnoLh
         meSipYgh8lg8f4i+i2SwbUV3m3RyEZMROQDsTplbv7c70AR1ERbJ9P1W+uwQhUlNgP41
         +ToU6anN+BWuwFGjb3nXQ128+5L1I0Ho2A4gqnzh18zW78m8vIKNb6lud1HBGLjBWddU
         PwBw==
X-Forwarded-Encrypted: i=1; AFNElJ96YKdH2jJNZ0WKc6G6vM/Z2DmImNMGwhTiizQO6IhGTU4Oh3YWh11RRlapKyWK5OVbpS3ceNuuL3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHxIoSLdPYL8GsWQ4NMqoBC7VRipG9/pOdWyPf8TSlO0rk/N8K
	g0KRcFO2VKhPdKjDLuis9UuPajypEA3Ma5nO0VpLYpYgSX0PcaXjxdLxmEhz5XWV4iV7mZs553Z
	4Jj713TQCj28OZQ6AGrXB/QU2+I9Y3SH4iWZmMpgwsxi/N0J7esa5KeFD0sZ+tFw=
X-Gm-Gg: Acq92OFcBjnaz0iDPvJ2CsZ8daNXYFo2+fMGVObzMoO+7MR54z0Ym9kv2XNfkdEblA+
	/r6u16nctfZa4vDbEmn9n9PpmLl7ufUzLKgVqodyeyMg+OYzDJZjlL5ojnjt/+IPNnPBuYFYD0J
	osyZVpHzobICsxyFnrhfWGlnwEGkP82+MLzI3Ice0rmrjc0Ugz/v2mYJIDNUGFKkfDsDOE4yPsL
	6Nh9SvYrbEPsrLdyxLvhanfAAbjQdOdHRtaN2qSSaYf0n6gV8H3Cvx96M1ai1koGu9ncCkLWwAq
	1HJClDZwosUITFWhgtkFgHwrmmt4+IwfFK69JqE1UF0O9ZtisX/3RNKSCLmKRCxT+PuW6hACZIx
	DviQhUVqSY+J1le5ydhe/DTbOngpoLQlLrr82HZNA2M15umkDFaEKYISP
X-Received: by 2002:ac8:5a16:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-517ee22d93dmr21156431cf.6.1781174263458;
        Thu, 11 Jun 2026 03:37:43 -0700 (PDT)
X-Received: by 2002:ac8:5a16:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-517ee22d93dmr21156111cf.6.1781174262936;
        Thu, 11 Jun 2026 03:37:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14767sm48355366b.5.2026.06.11.03.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:37:42 -0700 (PDT)
Message-ID: <2365c393-c6a0-46a7-acbe-72e6d52c9645@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:37:39 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: document
 snps,reinit-phy-on-resume
To: Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oliver White <oliverjwhite07@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
 <20260601231236.20402-2-oliverjwhite07@gmail.com>
 <20260605190638.GA4188454-robh@kernel.org>
 <45e5pepjwfixymk26uodz3pqhe44n2duo5dp5aflajbh3xv2kl@3nhzdev6dxq6>
 <CAL_JsqJi62TqakY6f+BzmaWx0Cr5m5KZT-GnMeLvNYRDTH-r3g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAL_JsqJi62TqakY6f+BzmaWx0Cr5m5KZT-GnMeLvNYRDTH-r3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bU7UPPj26MuH2eMC16a-_tDkKg-OVW0S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwNiBTYWx0ZWRfX0oSh5g1yZc6s
 t8C3WIhOnLP4WkjYsCcCI16p/JI9RizRyL3lDoukdnbEw1Qer+6FohlRXVSUN9gGzcOOd8t52sr
 9L3PyNUE02Nooitc4zeyVV6rDjYnbgY=
X-Proofpoint-GUID: bU7UPPj26MuH2eMC16a-_tDkKg-OVW0S
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a8ff8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Adm4HkoqiFglUZcFbxYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwNiBTYWx0ZWRfX/1FB/ZF5aLyA
 6FlzvYsQRj8ki+XdZXYHc0FExgymuo0B+YWL/yjyQ1fP+F7dvpxWqhiN5/Xvw6fdXK2PUZZO+Rh
 FovB9Pp3Jg67pb40xa11DjPPw/tlBKc42lEI1J9RBEM03WVFRGsv3qqTneuGRgAJQ4o+oucdNPW
 ZhxohCQAB9XNuvSbM22zUGP4JsHa46/7ICuPSGxa7ugqUrE/StueU6mmlCHHVQDq1KBva/JUWGE
 sFDVn/ecYbamj7+sy2Ut1iHPlxLkfPKR5Njihga2DLBeTWsxfd/oOuJ2cw+u5w2MGoHjEkPN3bp
 TLxM92E8iKLl7wF8NW5LFK7Tw01A6oqFvYMPHAM/7AFGnjoF712lEVdp7X8wsdVGVuSy8c0RQUR
 FLfwxQ5Vk+o9HlRw4GAyFIw3O4nm8/N3F4/H/gVdu+pmXnNu2trvoRVaGdNVITqX2kZz27C9k7t
 KJeNoSSkczVcw+QCBLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110106

On 6/9/26 12:00 AM, Rob Herring wrote:
> On Sat, Jun 6, 2026 at 6:21 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Fri, Jun 05, 2026 at 02:06:38PM -0500, Rob Herring wrote:
>>> On Tue, Jun 02, 2026 at 11:12:34AM +1200, Oliver White wrote:
>>>> Add the documentation for the 'snps,reinit-phy-on-resume' boolean
>>>> property. When set, the DWC3 core will perform a full phy_exit() +
>>>> phy_init() cycle on each USB2 PHY during the host-mode fast resume
>>>> path. This is needed on platforms where the USB2 PHY power domain
>>>> is gated during deep sleep even when device_may_wakeup is true.
>>>>
>>>> Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
>>>> ---
>>>>  .../devicetree/bindings/usb/snps,dwc3-common.yaml      | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>>> index 6c0b8b653824..d12f6ae81ab8 100644
>>>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>>> @@ -212,6 +212,16 @@ properties:
>>>>        When set, run the SOF/ITP counter based on ref_clk.
>>>>      type: boolean
>>>>
>>>> +  snps,reinit-phy-on-resume:
>>>> +    description:
>>>> +      When set, the DWC3 will re-initialize the USB2 PHYs during the
>>>> +      host-mode fast resume path (device_may_wakeup). Some platforms
>>>> +      cut PHY power during deep sleep even when USB wake is enabled,
>>>> +      and the standard PHY runtime PM resume is insufficient to restore
>>>> +      the PHY register state. This quirk forces a full phy_exit() +
>>>> +      phy_init() cycle on each USB2 PHY.
>>>> +    type: boolean
>>>
>>> This should be implied from a platform specific compatible string.
>>
>> Platform as in the "root node compatible"?
> 
> No, the SoC specific one in the node you are trying to add this property to.

Taking a step back, wouldn't this point to an issue in the PHY driver
itself?

Konrad
