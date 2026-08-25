Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C142A41A8F
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 03:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787627721; cv=none; b=h3EVFVWeZbn6dAvmfv3MhpJUe3RqLvScta5ilrC7lPbewDIaUMzw+QLyITzIlVcOAjEdnpD7hYJsnZ4ubaOunQeVXyf5rr3yBgnoPj7mofnFflJNZc59TXyMHhjse9E+SWZLISKvhCLvEM3NqzBXuWOhPVnXRuL/r/TF6dbY854=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787627721; c=relaxed/simple;
	bh=yPWrCzoXIqgAXeIruzKGmM/XEqVv57+pEiuntlLY9pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxJY9viWC+7KhRn3bX0WxmxS49BF4r+GPTadMQwKomJwXoAXSiGfGbEOrSurMxKM8C1z1qjjhpYO4NfbgdZtt3MeX7r4DAlOI22Gi/nFvnnB5OFLR2i0hTx6K0mh9TSaJ24E4K59LkocDpUQYk35FFt/a+yfDToM0ssUh6R85Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BpLqdgvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mg2Vc9iw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BpLqdgvd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mg2Vc9iw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RDvt405718
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 03:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zw9BJ9wTlK9G8KvdBmOSxdt0qW2SYtUaRVnoZ3uGJ3I=; b=BpLqdgvdoswUs+IH
	0x3lJdhCyzU/6Lw8XTtjV3s8hKAuzFKENCdytC2CgkspdTClE3qoJgDKA0DhX+NT
	igSqdvRkkEAtghKnZsMWKyYEJiHJAmz2G7+YUHB4Rchn8hDAsO3BaRVltt/mveIh
	YroTGR8FTS4mzgkvGg2SBR7GTh86zi+cDOU8FEc3w0t3NtFGT77cqGSNo6Lx7TN0
	OGLFLmU0uv8/SX63TkaiMMBLsxJGk9n9WMExDRZ/tED1VqKXQJsUBE+iFwEAeYmM
	YVvRGtZ0V4AGs1iSBR1pYw97ctU0VS1xbRPv51XDTnUoAwhcxsRNEolVbmEZL48f
	3gKABA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jgmxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 03:15:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so87571935ad.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 20:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787627717; x=1788232517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zw9BJ9wTlK9G8KvdBmOSxdt0qW2SYtUaRVnoZ3uGJ3I=;
        b=Mg2Vc9iwQ7+94JOcSN0TWLX0K+ImQdLBmxQWHDGGS1I7QhJiX5oy5JLgSgJJThgka+
         vGbZiaF3MDgq2K/1g072x+qIcXq9o5YOjl7Ju/AK+j88GMckxfVMajaET6Qrs779o/6w
         O1t3wy5XMyS1J+1d1kTcE4mozhPz88eGN59VyNiwloRcEGPOhRBhmZudoOMcAVPuTxnP
         YyWSyN9QxjcWR19UhbCJ5hW2cFqVvMw7BXovz1MH45O/Rx43IwZXXQiQjKab/ris5h+5
         9liPqcqxuWZWUiz04a5eXCnPGslr8nQBdAVc5LIFZ1N5yma2YUeW+1PO1aqkQniHnjeM
         HAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787627717; x=1788232517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zw9BJ9wTlK9G8KvdBmOSxdt0qW2SYtUaRVnoZ3uGJ3I=;
        b=G4cVDsiKq//nuTZMEFRNG5Z5IVkeN3aS6ow7aATNJuDbQwvSrh4Yzh1bi4FlHgirW1
         tnSvA6NiB/xCbf4AhhakPRvMryeOzhkjeiURlYnPoTsVhh8J8uavXLja5abEeohGPEOr
         T60KvbSNsHrTlWZZeTpFnolF4moD207lP1f+APUIvx0EV7HAIBxhF4wEw5Tg7B/i+I3H
         viKpYw0AzFzd7N4Zf2WnRRNGXSp/bvxtQrHuML0vMNHAC55vEPeWc2DEM4tqKhO0FugR
         EtyzR9H6J25EwGXOsbNvCNzPSk+Bw119lbMOJz3gF3NPQVKMtfjuOucWbue5UkrI5xpu
         tR5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrplVtYPAE0rGOUmsEpzSypqtoR5PDq2ZtK2A9sHcg+HacfsBXksL2l9EmuM10v5/H2atXTJ+3iEhI=@vger.kernel.org
X-Gm-Message-State: AFuF++kI+YZj5ANfDjG2FIgki4TUbC8B6WR6WhdmRmIihaYu0VPdoiwa
	NwH7MET8G8/U4PadU1y4nhms2IaE/HoXBdRORBbNTzUNPUiORGlxKjD5Lj6Rquvvba4hLrBrsXU
	qEQeZQMMDrqt0Vr2IzYqPf4Kp9bk2M29rjgaN/2eJDFfbMTU5i36Ng6ph07QVP+4=
X-Gm-Gg: AR+sD12PVPQGANBJ6dPGKeA43f02w3xTe/Oc1kIVuA2GJN6nvjuviuionoRB6IhlUZr
	ywvN47yVLoY8u8Ntnn5vNWl8Ftws0YtWc4FVqQlzx1Z3giLVVWamDoOZEHYcUJzo/nnchH/2fO5
	lvMlWuSlRMnxfTIMV+L8PSPofu5VIjRDUjKnXQIsH5sW5hpOc1jwVwexSoMIi6W9YDUDav/X7cB
	AcC8jCUvCrtQo2uASuJG++HrQFHrAzUKEWFqHMPZSFyZn9akteAL3oqkRmWvx6AeQuutsecH9j6
	vkCubcN/+8zXoGRX4fi7V6MVbTxRLtPw03mMf/KPUXjv6QXSdmVhLv+PQuS2tv5KC3Pat1ijcYs
	2kjr1RAbyNu8domASdCFDQP0pHw+18A==
X-Received: by 2002:a17:902:fc46:b0:2d6:dfa7:fad4 with SMTP id d9443c01a7336-2d6dfa7ff18mr60428245ad.0.1787627717500;
        Mon, 24 Aug 2026 20:15:17 -0700 (PDT)
X-Received: by 2002:a17:902:fc46:b0:2d6:dfa7:fad4 with SMTP id d9443c01a7336-2d6dfa7ff18mr60427295ad.0.1787627717013;
        Mon, 24 Aug 2026 20:15:17 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32801d7f812sm28570652eec.1.2026.08.24.20.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 20:15:16 -0700 (PDT)
Message-ID: <502df11d-c372-445d-99a8-512fdb0e9a4c@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 20:15:14 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] usb: misc: qcom_eud: add per-path role switch
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <c0215cd9-3973-4306-85e9-d58674d6bc83@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <c0215cd9-3973-4306-85e9-d58674d6bc83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d08c6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=L8Mv0my-441DvGKMhw0A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyNCBTYWx0ZWRfX8WZk+8bVQcs3
 xdH9NTCJ15QDxizr9E64KgeoCuJ09pF0o3/wJOTmEWPvbXwjcCOPbJtxk/OFLD8GZXNPZ76wNY4
 1HECly87drOPzX8SEUQTiXbTaOG1R3H7KmijvTdzAsney6VeNFoAxI4svtHFhfyunqH9wrVKcvq
 kuKk3xunZuwZItl1nzr7189pB7/hMSiYJXuz9hj75iVxUeXL6P7tUPlD/2QzPm2ZJ1DpaZwTTfM
 TxaZ8FiYBjG5Rdh4Y8iAakLpyl0nDOBVaD7X+R7EZEtr6iZquMDTTzu+fo7cN+PSzaz9XY9EdC/
 hIstdDDrOpVOAY6pxmoYdRFr+cx1DTZM+utj6xQiF3DjDAf000XQEFI5rePwDtgG2I0vSnmTwhh
 nWraeJZdfJJhjvGPAp/O6UwCkEgAR9Yk6SU97YGT8i6EEoF0wpCKfCHNlsvImacsV9ui48pR4Kj
 FGyYePQs+tgM02fpnRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyNCBTYWx0ZWRfX870X+kc1lkJb
 Lw4jRL4MIh2vPpY7QWG4VCZ+Muo0jK/vj1S/J7tToPZs3sL3EZto2arUknt9vcwmAV1WSzPOgbv
 WaQ4FavfOxKymg2ZR+C9zg1+ghsDNjM=
X-Proofpoint-GUID: mfRJ0SLngKAF2fHXlmwWHGAOMX3g2ar_
X-Proofpoint-ORIG-GUID: mfRJ0SLngKAF2fHXlmwWHGAOMX3g2ar_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250024



On 8/24/2026 6:44 AM, Konrad Dybcio wrote:
> On 8/11/26 11:36 PM, Elson Serrao wrote:
>> The EUD hardware can support multiple High-Speed USB paths, each connected
>> to different USB controllers. The current implementation uses a single
>> chip-level role switch, which cannot properly handle multi-path
>> configurations where each path needs independent role management. Since
>> EUD is physically present between the USB connector and the controller,
>> it should also relay the role change requests from the connector.
> 
> [...]
> 
>> +	if (!strcmp(dr_mode, "host"))
>> +		path->curr_role = USB_ROLE_HOST;
>> +	else if (!strcmp(dr_mode, "peripheral"))
>> +		path->curr_role = USB_ROLE_DEVICE;
>> +	else
>> +		path->curr_role = USB_ROLE_NONE;
>> +
>> +	/* No role switch needed for fixed role controllers */
>> +	if (path->curr_role != USB_ROLE_NONE) {
>> +		of_node_put(controller_node);
>> +		return 0;
>> +	}
> 
> IIUC think this is a bit of a convoluted way intending to say:
> 
> if dr_mode != effectively_otg
> 	return
> 
> I don't think there's much of a better choice in APIs here, so let's
> maybe just do something like:
> 
> if (host || peripheral)
> 	return 0;
> 
> directly (i.e. without making ROLE_NONE the "desired case" as that
> is very much not obvious)
> 

Sure. I will change this in v7

Thanks
Elson

