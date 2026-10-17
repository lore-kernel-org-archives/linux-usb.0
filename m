Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3E8343893
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 01:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792199672; cv=none; b=WmEAGPU/6U+LzykZmCOzZpAuyT29GBNzzJS3beRA53FZp0W1utXh5gD1CXFef91kTcUwtsVM8d/nuO1HbC97CwW5BvB/fpyfmLOOPmGnccBRFfVuLTTo2X8EwfDghCheM/Z7w3SM0WtUA5C1FylkFbcpxNxxfYBJJOQMd+2tav4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792199672; c=relaxed/simple;
	bh=wb7fEPNZKS32fDHKkmXxrKiBLAZBQfICfJnuna9llUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l2fQhKbTzn6acKOMYxdAJEBcPo7tdKBAXZ9/mtH6bSSbJ7eXVM/eliqSC+xV0aCTIM646FFbacyAFScXkjEDH9a57Zoypb2bN+epxb26t1xgqRlPWjcYRk2pQSdOO+TKtnA3qYcn5CKRZlGnpWp8DcZ3hSNdOAjWReREq7F8JQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXzoLO+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYP2vhjZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXzoLO+l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYP2vhjZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFIOO3322683
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 01:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+zMslp4R08qyyVZNLg2DRXloJ0T40N/Kg5Y9YRyifgk=; b=aXzoLO+l2BHVT41e
	HMpAlnMMa31+trGX6g+azKpscKfA9TVYsOdy6Trte3D/d6PECK38YSiV8BFksLvH
	ugU7IU+LM6lcJt5eEvcwxbqbaklIgfV7/VqwASAoeDYICOB70oInHZDLlIET6Si0
	o52wuRPrY67irV/ghrRqmlU043BWYlucLhApYq6aV+unH1xz0DXIT+uI6WbMxxnm
	dn6jqpih4c5+gb+4GBD4sVwpX4VzmsLj9gUs7Erm+xx+G5sjgfNZQifyAKdNf8Xf
	bhSgTnTCWxUVhQqay5G4VPNdUENNTDhkeFRy/y3TVPowiNuI5YmyM0yOdKq1Ncw5
	yDhF7g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhumtxcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 01:14:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso531564eec.0
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 18:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792199668; x=1792804468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+zMslp4R08qyyVZNLg2DRXloJ0T40N/Kg5Y9YRyifgk=;
        b=OYP2vhjZ/eHRFH52AV7MXUvsZtFU6kLVUqCXlBRqt+7J3O4KCoJZcKKPFtXYO00cW0
         ZrAXF4VjefcFlk3qIV92xyYfAhUqUe+VToJ8ghCs+zd3oZR1VZHFZRTt84Iv6TfZM4qK
         dOTSRwWRsdnwDOZyNjVyufM6X3AkU0slJ/qlT3bRHbQGxy+an7ZNci9vZFOfLm6AahZL
         v7LWx4oiX14M+Og7nZ9SdT9uz1k8tJ4JH3CEq2o8cij/NXOItQcB1dQkCZ1aA9Ot9De7
         rp6n2W5Djh0vF/+fsZn7LIzZSwgRlsYqAHn+IAqQb+v1fuPCPL0W0wROkkRZOinL1+Y4
         wS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792199668; x=1792804468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+zMslp4R08qyyVZNLg2DRXloJ0T40N/Kg5Y9YRyifgk=;
        b=gn3HVurp46JflBJRmjPRmd2A0KtND0sokmtYo0qyLRq5MbUBDDH/G3aMULXigFgYtg
         K4Jov4fS6cWSHdZwRhcjTukpXCigyYX0CmmTzIpe3jMRsVG9ClIW8L9UqpeDnQxLiLI3
         AgNLmx1abllqZSJb8MgxvzYUNSOU6f+dCR4dNYqLgki6I+znDDME3G24UQU5tZ6rFpT4
         eFqCLzgbYceiEDgm4WA/6hxfd+BjNSaFKaEyAel3x4GFkLAcUknBRnIPBsjTNWydb842
         FTPLVHtsVpC1HaCRApS8ji4UV5wI/gBzjnnFLkAh8xzg9qRk/qanRwh5Te/EBwaFKN6s
         j/rQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTBZ+hYxA0UrbWT+MzmYu2IeOhM0UQJbMzyUforHHkr3Y2xqeWVJwev+dyJ8ANDVKQPFJ8Nv+ue6I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZxsyUbHjxjplQpaR11qAF40ee3o/kArRhaHF11qW9KrbS614Y
	cl5M2rFeAj/TKRX3aC+nWkkC2GIE5zFIQwXyh1WEdsph+qaDGYUeP7CITdEukc3JNu3+mIELBFE
	oNnJErxFKnllfk9Ztg1Su6bW4o/mhpWQ+Efsf8hK8CQOPBr7MxzRBfQrsuK5ePQc=
X-Gm-Gg: AYBFou1k8SS+aV9Aqvw2vdwH9YWfnaeAaNPbBZKY5WiAG9C0BWbwNlN7w9GyE0zgxB5
	jxDJ31f9SiHj0c5F58NMU0ZPPWo5DO38I4ORnUwlDVLPVdKJ1HWw5S0q6vHyikV+VejUOUcUhzz
	cn1QNDHY+UfG+imZjidsl5FqAXN4RmO2vL/MWKisiQQK4G1NArSRS29GgdKkP+32boZmNexVLuo
	4ZBKmuCc5mo0z3VYlt0PyC8N5DArraeoIvksZ5mdmDJcnzdn5NWPMxALue/yo0DzYmWLDfpOA7u
	02gEOGxhGiexhiPt0saPbWc8kRo5aCTTzGcVacaS27uomdT/AZwIzBWJxEMz//EW9IkrHzJFvI8
	1Clpa/sWyufYdpv+zshLwVuSh9uW4fA==
X-Received: by 2002:a05:7301:18a1:b0:34e:f5f1:2f46 with SMTP id 5a478bee46e88-361a0e85ef0mr1712661eec.6.1792199668384;
        Fri, 16 Oct 2026 18:14:28 -0700 (PDT)
X-Received: by 2002:a05:7301:18a1:b0:34e:f5f1:2f46 with SMTP id 5a478bee46e88-361a0e85ef0mr1712600eec.6.1792199667129;
        Fri, 16 Oct 2026 18:14:27 -0700 (PDT)
Received: from [192.168.1.133] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm10294370eec.23.2026.10.16.18.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 18:14:26 -0700 (PDT)
Message-ID: <ba7e8dc5-a5a3-45de-a1b3-ca200faf1ed5@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:14:25 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
 <944d39ba-6e1a-46af-b5ee-32140947f924@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <944d39ba-6e1a-46af-b5ee-32140947f924@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwNCBTYWx0ZWRfX9YVbem2fAZmO
 R5jdgTCBLbVy+HHt4gG8hEuhg3VygATgt5u4H1c8OrAV7zopB4qdLKunmIhzaGm/clEbae5oHMP
 TAonN/ZwG3jBPDrlxTAK8rhYLnk+OHE=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad2cbf5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jtekIJVuu605EDGJeY4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Pe4ajFMOgBN2kR9NwaSlrpGETNbmWZXd
X-Proofpoint-ORIG-GUID: Pe4ajFMOgBN2kR9NwaSlrpGETNbmWZXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwNCBTYWx0ZWRfX4X38x1OIuMKE
 fqJINlrqF/sTj9uclg9/1PEEr8TgW99YlighHCXOlfW3RVrUuuUSKlJH+W1HUMfP1aqu2/QUgrX
 G//lSotA6o4b95IFB+cWv75gVndzZwsPYgt2vCEARZxBwDIS2P0yB9Lek1/A8UwjabjFVifs5pq
 l1vcF32RbYX2ldV6+Ekp3LS1jgaQjESkYRL/S9p4hjKrZY0qwRq6r4M5Qyn+zyJfprXaWfSpZpP
 F7JY5lld5Lay/JjMEKuRJTifIbz0qhfSlK71dPLvA9rmyxS0rVaSJ++M7ZhPlkzvh9+05FAzikO
 gXRIFgl7++3DbMTs4oUXWd37tg8b6Lj+UpohaQABpsihL45QU8EVuPEfpjaGZdKfc3jhw1sMHmj
 Z6b1EbXbEUyt57ZBBjXUq6do7cL3cBDmyaXRveuBz6zqCWsKxPhEx6FoNQJRoRRr9OS+eTXb6mW
 3GlK6Zkz7jmAJf+UuhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170004



On 10/15/2026 7:44 AM, Konrad Dybcio wrote:
> On 9/29/26 11:35 PM, Elson Serrao wrote:
>> The EUD hardware can support multiple High-Speed USB paths, each connected
>> to different USB controllers. The current implementation uses a single
>> chip-level role switch, which cannot properly handle multi-path
>> configurations where each path needs independent role management. Since
>> EUD is physically present between the USB connector and the controller,
>> it should also relay the role change requests from the connector.
>>
>> Restructure the driver to support per-path role switches and remove the
>> chip-level role switch. Additionally, as EUD need not modify the USB
>> role upon enabling, remove the unnecessary role switch call from
>> enable_eud().
>>
>> Reviewed-by: Peter Chen <peter.chen@kernel.org>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -static void eud_role_switch_release(void *data)
>> +static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
>>  {
>> -	struct eud_chip *chip = data;
>> +	struct eud_path *path = usb_role_switch_get_drvdata(sw);
>> +	int ret;
>> +
>> +	/* curr_role tracks the role from EUD's point of view */
>> +	path->curr_role = role;
> 
> This should be assigned after the fallible call below
> 
My thinking here was that `curr_role` should track the role requested by
TCPM, rather than the outcome of the downstream controller role switch.

When TCPM requests `USB_ROLE_DEVICE` (e.g. cable insertion), EUD should be
enabled regardless of whether `usb_role_switch_set_role()` eventually
succeeds or fails. EUD access is tied to the requested device-mode
operation, not to the controller's ability to complete the transition.
Likewise, when the port exits `USB_ROLE_DEVICE`, EUD should be disabled
irrespective of the controller's state, since device-mode EUD access is no
longer needed.

If `curr_role` is updated based on the controller's outcome, EUD state and
`curr_role` can become inconsistent. For example, TCPM may request
`USB_ROLE_DEVICE` and we enable_eud() as per Patch6, while the downstream
controller subsequently fails to switch roles. In that case EUD remains
enabled, but `curr_role` would still be `USB_ROLE_NONE` (see also Sashiko's
observation with this approach 
https://lore.kernel.org/all/20260811215406.7FD161F00A3A@smtp.kernel.org/).

We could keep them synchronized by rolling back the EUD state when the
controller role switch fails. However, I don't see a strong reason to tie
EUD state to the controller outcome. EUD is intended to operate
independently of the controller in device mode. Preserving EUD access in
this scenario also provides a means to investigate why the downstream
controller role switch failed.

Thanks,
Elson

>> +
>> +	/* Forward the role request to the USB controller */
>> +	ret = usb_role_switch_set_role(path->controller_sw, role);
>> +	if (ret) {
>> +		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
>> +			usb_role_string(role), path->num, ret);
>> +		return ret;
>> +	}
>>  
>> -	usb_role_switch_put(chip->role_sw);
>> +	return 0;
>> +}
>> +

[...]
