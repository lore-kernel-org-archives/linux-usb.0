Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207880;
	b=eO6tue5symoTaIk+oUfmo4FRTCAu62enhdKVXZwqrJHKUHUJKBOSYql2svo5+H6y/VGj
	 9ono4PfDTOnNEl/ETLr3JAchF/1TPJgN1X7N4YwGy4JhLMpDetj7Pj5NoQ377GvmuKEKc
	 k1ONJO9A0qaUMMgkjSr4XKiX+OG12Qf6HLVWue78bzjh4dUSOL/YpTflq7Fdp6tGUg2cv
	 41vpjM90Is5JMVq/OoRhFoNzkyCnSavTQldDl2nsSLMwJ9NmKsuWngRgO27XW+jnqtKHj
	 ViN0JesL39GEbSEkht9fKch8LrRi1ktF/AqZYJ/SUUCMOHPB+RNqvsDvASz4JEh9aLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LAsDZInV195QFG9YcqW3Qj2NrjZbQEXmSac9Yxv4PQg=;
	b=U4RBwCyZxf7aK4iqF/DNJX87WRgZXDrJR9tudQwPX85jLA5w3VfZMpKxM+edT7bHGlhF
	 ZWVYgS3iw7cFbeOno/1VH/BqLbMpFPmoLMbcypm8/HVJ0Q8WnWasknYeeCAHdmYXVINSK
	 urGtvdcl6ieAqQVK5IBCocCj1alV8jUaOy8Q2ySW/R2lLMm2S2DjoLJ4meD+geFW201be
	 UDLNIoqm2yHN8YwJC1X2+kl5Fxj1OxgOkubiPgT/uJSEeAyrY74pDesk4pnM2YCQLm9xi
	 +iLKTZRgj0QqL171CE4sQocjWJRD3VNKb2dMqQN4N/eXE2/ce1ofgp/nAY+WRBon/fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MHIjwBdH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ecUBtY5T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980BE606A31A
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 17:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 980BE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MHIjwBdH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ecUBtY5T
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SF9ujQ4164748
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 17:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAsDZInV195QFG9YcqW3Qj2NrjZbQEXmSac9Yxv4PQg=; b=MHIjwBdHdjeK6yli
	9Wbz068RmTNqueWQUph68D1zojIT9iEobJsrFYRWOv4+MOBSjj2wBa9yzTEc4nfl
	f69GNF4jKh1+tPrQnm9T3RaeZZXStPvJw6q49p3n/OfQknyvT+XgudmPpsKpgnMe
	Gs4WPZFJw4BSOkljAfcFrqnhQQu3EPzm8Y22Na/sR2aufmOHOexPtuEgdNjO1d7y
	1gYcEe4LbOx5FK7pCIgMM1spBUGJfViTPQ0RPs4yOXASU0oE1K+OzO5iKqJx9TGs
	VNdrdrmfn5dVu0wtNQNZbdmSUFzjRRG34q5IVYrb6rI28M/XBPCkQUVA+zFLeuGM
	ds6mag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnh3fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 17:17:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e05d31e54so986607b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 10:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793207878; x=1793812678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAsDZInV195QFG9YcqW3Qj2NrjZbQEXmSac9Yxv4PQg=;
        b=ecUBtY5T5AGwbNprXj7ymZTOKJdseAZ7mPQO2s9Es4F3+LcREdCoeKC9BYr7f5emu+
         1GlZl2doafyi1kVM2Zxyz+bmkNCenDPwlBdr9ylckoiBGSePklF4pvLMmnqneV440/aD
         RFpceC+wwYutssgrdE5Ex16UfrbK52YTuRdMZ9uqxuFM/b+T/wbTLXDtpys0coAXatpT
         th8u4BTSn4VaFLrYKgSOi5EjycP16/z2/K20IuIKUkjku8CAbfHHtH3FkQeih0Bhep6j
         /QnpBpwJ9jTrqYwccv994MoVTZasvb92wJHxIVMBRciL/4Q7upKqB5rolzCHNk4BVptq
         wFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207878; x=1793812678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAsDZInV195QFG9YcqW3Qj2NrjZbQEXmSac9Yxv4PQg=;
        b=qA6UZFz2vV3XgF1g3VOwe+aLy6dyZQfSoME17QLIHMG7OX24sRryK/yIL6e0ogy9Yb
         Fg31IFhEr+Agwa9C2GyJW7pCBhtxSpfAUAG9JRGnZt9dnJBHTT9KGexbRoOajNOLT2HQ
         n0gtUNLLZ2fOB2XaQoH9GPeFwgsNaNnPEvtbkjivDHGlZeTvd2rsuLRsK1IQZvJK/ZcE
         xdcIibaNuYbvyRu3Y7wLEKOkqKCcNdoffrLBpt0AcldVaKNcR0JHXcHGjZWn14q8+bVc
         /KSqDXviLI3v+JYCczL5msOxsyoqzcOcbAe868LnUdvAhloa3y1lcJg/niXn5P9HTY1w
         0R5g==
X-Gm-Message-State: AFq9FYKpiV0nUprM5gqvWB6Caa8AHrAtNJyhhjLl3Ul7nNKgWQ6uqLY9
	fKAgZEHb/zvsLPERAavho8h73hUqBi+8lcyfh8TVwFcjji12MEzBpAP2jJLw+s+MoBE4OHhxklC
	MvIxNxhyEhaRwKUiV8mvzmjvWFun0YlqOV3d8VAFTws7dUxyZBf22YhMtGZmcW18=
X-Gm-Gg: AYBFou0lQiW7f+fdHE6MVNeM78awyykGbCMT61lhzzMbUcZzN/0fi24i6hIkHvKk5v8
	1qLY5pZMgh9TKzyQup1bI+5cVglmKurViaMxFeOMCwzQ/ij7GmY8n1Kqr13ZllyMEEJVKQXhEwP
	V8fLgV1zUyv/aaI4goSZSYS2oSk3AWqqKkDZcJI27CSgU1C8rtMSqWO0RekR1rCi05V/4z0oPEQ
	YucKuCoh6iBcK2u+TfR7uhQ5c14xXXrVNfbsz4Hc1oW25ZNZFUGKTuB79EgMwi6DqrySXeYGnrr
	NNprwZtZuHKWWn+NN1t62BrS+nX3I/dllnPR7ojiTZgztDLIZWYKIgHf/APRvvCF6GELynBFR6Q
	V2o47Zox3cAP4q8Lojki5xQ6xOU97W7sNGUYMijI4FkBVkmvgrb1euHRzYxASz/FJwftvI3gynX
	vSKvMCULLNn9IgX9ZHbZ4KNoeZFaQQWEp6WWBt1zsu
X-Received: by 2002:a05:6a20:6a25:b0:3e0:d508:59b0 with SMTP id adf61e73a8af0-3e902382a6cmr2223706637.34.1793207877997;
        Wed, 28 Oct 2026 10:17:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a25:b0:3e0:d508:59b0 with SMTP id adf61e73a8af0-3e902382a6cmr2223686637.34.1793207877421;
        Wed, 28 Oct 2026 10:17:57 -0700 (PDT)
Received: from [192.168.1.6] ([122.177.241.224])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a6c03c09sm1454483b3a.35.2026.10.28.10.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:17:56 -0700 (PDT)
Message-ID: <138abb5c-b1cb-44e5-a103-dccb022f3102@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 22:47:54 +0530
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
 <d45f758a-8d00-4f76-aef9-7364156f4ce3@oss.qualcomm.com>
 <as7c1LHrOsqAA4Nx@vbox>
 <94c4056d-7f7e-46ef-97cd-dd12621260bd@oss.qualcomm.com>
 <atAuSs9VTveGwzpy@vbox>
 <526b4857-4a4e-4ebc-a367-bdcf9a9c9a53@oss.qualcomm.com>
 <atgaF8VoapljDa2f@vbox>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <atgaF8VoapljDa2f@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xUdPpl75svp9Poc1bxefH13FtJPH5kMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfXxC1Vy3Nv+2nd
 dY/+mL7QU02FHhv9HabZ16MAl4cThUMrmU3Ra5qC/IcMHgdy8qENAQ8hct+wxPmzdEtliZI7Dic
 AntCsYHZZdKsTWtr+fHtms6xy04GElY143ozYePb8PCbk/xK68njHtX/bdTo7sKVTgNkIsgtgZM
 DlI3PUwhHifeGbaQMW72hgmEphUJVc8LcF3PKOGDs5Y5rACIAsfhYEp2W+WPTPerjenHfKHFU3Y
 gLLD9IurGuVdOkBNB6hzhxwGsCcenQH+zyMTwXlznoSEr3EGNzEbRsmHpQHyjL+F5HxS9lE0t8o
 CfXtP7iwZzuCnaQkYdK+ZLPn2UTbvbLKSYWfauRigIsYWqBy7iE5JMTIsyA+lHdZy632AMQF6YR
 tk7Wy5Msmtg6N35c0FT0rFUQFklW7+i2S/L6M2SjIvzinP2+bTMNC/bMx9fEFaqtGY90sxe2jWC
 V34eXcuHWR/rSCbj5+Q==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae22e46 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=VANyJ50yWUE6IziFVoGcxg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EyA4L-WO06RbGTTq3NMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: xUdPpl75svp9Poc1bxefH13FtJPH5kMx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX58miWHYDutmL
 EmBZ5z6D3bfnCwUHr2aiFtUclVeGQ6myo+pX1f56Dc+Yvt9tzzuYXNqtprmR3pHvWyX/php6/eW
 r+WjeNuTcZev13DfRFZni0XgxNgZ0Cc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280068



On 10/21/2026 7:31 AM, Thinh Nguyen wrote:
> On Thu, Oct 15, 2026, Krishna Kurapati wrote:
>>
>>
>> On 10/15/2026 7:42 AM, Thinh Nguyen wrote:
>>> On Wed, Oct 14, 2026, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 10/14/2026 7:14 AM, Thinh Nguyen wrote:
>>>>> On Tue, Oct 13, 2026, Krishna Kurapati wrote:
>>>>>>
>>>>>>
>>>>>> On 9/29/2026 10:49 AM, Krishna Kurapati wrote:
>>>>>>> During plug-in/plug-out test cases, it is sometimes seen that no events
>>>>>>> are generated by the controller and all CSR register reads give "0" and
>>>>>>> CSR_Timeout bit gets set indicating that CSR reads/writes are timing out
>>>>>>> or timed out.
>>>>>>>
>>>>>>> The issue comes up on different instnaces of enumeration on different
>>>>>>> platforms. On SM8550, the debug log is as follows:
>>>>>>>
>>>>>>> Prepared a TRB on ep0out and did start transfer to get set
>>>>>>> address request from host:
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.421006: dwc3_gadget_ep_cmd: ep0out:
>>>>>>> cmd 'Start Transfer' [406] params 00000000 efffa000 00000000 -->
>>>>>>> status: Successful
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.421196: dwc3_event: event (0000c040):
>>>>>>> ep0out: Transfer Complete (sIL) [Setup Phase]
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.421197: dwc3_ctrl_req: Set
>>>>>>> Address(Addr = 01)
>>>>>>>
>>>>>>> An XFER NRDY is received on ep0in for zero length status phase and
>>>>>>> a Start Transfer was done on ep0in with 0-length packet in 2 Stage
>>>>>>> status phase:
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.421249: dwc3_event: event (000020c2):
>>>>>>> ep0in: Transfer Not Ready [00000000] (Not Active) [Status Phase]
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.421266: dwc3_prepare_trb: ep0in: trb
>>>>>>> ffffffc00fcfd000 (E0:D0) buf 00000000efffa000 size 0 ctrl 00000c33
>>>>>>> sofn 00000000 (HLcs:SC:status2)
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.421387: dwc3_gadget_ep_cmd: ep0in: cmd
>>>>>>> 'Start Transfer' [406] params 00000000 efffa000 00000000 -->status:
>>>>>>> Successful
>>>>>>>
>>>>>>> A bus reset was then received directly after 500 msec. Software never
>>>>>>> got the cmd complete for the start transfer done in status phase. Here
>>>>>>> the RAM interface is stuck. So host issues a bus reset as link is
>>>>>>> idle for 500 msec:
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.935603: dwc3_event: event (00000101):
>>>>>>> Reset [U0]
>>>>>>>
>>>>>>> Then software sees that it is in status phase and we issue an ENDXFER
>>>>>>> on ep0in and it gets timedout waiting for the CMDACT to go '0':
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.958249: dwc3_gadget_ep_cmd: ep0in: cmd
>>>>>>> 'End Transfer' [10508] params 00000000 00000000 00000000 --> status:
>>>>>>> Timed Out
>>>>>>>
>>>>>>> Upon debug with Synopsys, the root cause is as follows:
>>>>>>>
>>>>>>> During any transfer, if the data is not successfully transmitted,
>>>>>>> then a Done (with failure) handshake is returned, so that the BMU
>>>>>>> can re-attempt the same data again by rewinding its data pointers.
>>>>>>>
>>>>>>> But, if the USB IN is a 0-length payload (which is what is happening
>>>>>>> in this case - 2 stage status phase of set_address), then there is no
>>>>>>> need to rewind the pointers and the Done (with failure) handshake is
>>>>>>> not returned for failure case. This keeps the Request-Done interface
>>>>>>> busy till the next Done handshake. The MAC sends the 0-length payload
>>>>>>> again when the host requests. If the transmission is successful this
>>>>>>> time, the Done (with success) handshake is provided back. Otherwise,
>>>>>>> it repeats the same steps again.
>>>>>>>
>>>>>>> If the cable is disconnected or if the Host aborts the transfer on 3
>>>>>>> consecutive failed attempts, the Request-Done handshake is not
>>>>>>> complete. This keeps the interface busy.
>>>>>>>
>>>>>>> The subsequent RAM access cannot proceed until the above pending
>>>>>>> transfer is complete. This results in failure of any access to RAM
>>>>>>> address locations. Many of the EndPoint commands need to access the
>>>>>>> RAM and they would fail to complete successfully.
>>>>>>>
>>>>>>> Furthermore when cable removal happens, this would not generate a
>>>>>>> disconnect event and the "connected" flag remains true always blockin
>>>>>>> suspend.
>>>>>>>
>>>>>>> Synopsys confirmed that the issue is present on all USB3 devices and
>>>>>>> as a workaround, suggested to re-initialize device mode.
>>>>>>>
>>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>>
>>>>>>
>>>>>> Thinh, Can you help provide your review on this patch.
>>>>>>
>>>>>
>>>>> Hi Krishna,
>>>>>
>>>>> If the CSR_Timeout bit is set, why not check GSTS.CSRTimeout directly
>>>>> instead of indirectly checking DEPCMD type mismatch?
>>>>>
>>>>
>>>> As per discussion on [1], implemented this checking of DEPCMD registers. Let
>>>> me know if reading GSTS is a better option here. Will send v4 accordingly.
>>>
>>> At the time, my understanding was that all register reads return 0 in
>>> this state as noted in that conversation. However, based on your commit
>>> message and the databook, GSTS is still accessible and CSRTimeout is
>>> set. Also, on CSR timeout, the read data is residue from a previous read
>>> and isn't guaranteed to be 0. So the DEPCMD read back isn't reliable.
>>>
>>> Can you check GSTS.CSRTimeout after the CMDACT polling instead?
>>> Something like this:
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index ee837235630a..ff4957a7311e 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -283,6 +283,8 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
>>>    	return ret;
>>>    }
>>> +static void dwc3_schedule_err_recovery(struct dwc3 *dwc);
>>> +
>>>    /**
>>>     * dwc3_send_gadget_ep_cmd - issue an endpoint command
>>>     * @dep: the endpoint to which the command is going to be issued
>>> @@ -432,6 +434,14 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
>>>    		cmd_status = -ETIMEDOUT;
>>>    	}
>>> +	reg = dwc3_readl(dwc, DWC3_GSTS);
>>> +	if (reg & DWC3_GSTS_CSR_TIMEOUT) {
>>> +		dwc3_writel(dwc, DWC3_GSTS, DWC3_GSTS_CSR_TIMEOUT);
>>> +		ret = -ETIMEDOUT;
>>> +		cmd_status = -ETIMEDOUT;
>>> +		dwc3_schedule_err_recovery(dwc);
>>> +	}
>>> +
>>>    skip_status:
>>>    	trace_dwc3_gadget_ep_cmd(dep, cmd, params, cmd_status);
>>
>> I don't have the apparatus to reproduce this issue at my end currently and
>> extremely difficult to reproduce at customer end. Will send this diff along
>> with your suggested-by tag if that is fine.
>>
> 
> I'd rather not take this without testing. The check adds a register read
> to every endpoint command and implies that CSR timeout is expected
> during command sending, which it shouldn't be. Without confirmation that
> it catches the issue and that recovery works, that cost is not
> justified.
> 

I won't be able to test this in my environment. The only PIPO test that 
easily reproduced it easily was with one faulty cable from (IIRC Xiaomi) 
and CDP port of AMD based Lenovo laptop (there was a particular variant, 
I will find out). I don't have that faulty cable for now, but this issue 
was reported even on Kaanapali as well on 6.12 Kernel (mobile build). 
Not sure if I can provide this series along with err_recovery_work to 
OEM and get the results since this is reproducible with very difficulty 
on their end too.

How about we add the Depcmd check and then the GSTS check inside it ? To 
avoid checking GSTS always.

> Also, looking at the original report again, the stuck state could start
> without an endpoint command being issued. Unplugging the cable then gave
> no disconnect event, which blocked suspend. A check only in
> dwc3_send_gadget_ep_cmd() wouldn't catch that.
> 

Currently on downstream, the way we work is that if we unplug the cable 
we expect the controller enter runtime suspend. If that doesn't happen 
and the controller is stuck, we do a 
"usb_gadget_disconnect(dwc->gadget)" and then upon re-connect we do a 
"usb_gadget_connect(dwc->gadget)". So, if upon any plug-in, if 
enumeration fails and if we encounter this scenario, we are not handling 
this until plug out is done.

Regards,
Krishna,


