Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880EB331EB9
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 03:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034299; cv=none; b=nkerjw0VjH84wfmBSQFie2m+y9cXuy4mkiLsAEnFdnpjUH/WtM8Oy7P4UTIKnlL/EmnMSokpLvAUyhdB2+Gfy2hJRZH9ukouBSQ0TqLCxv3Ehv7fdgQGv0JlhPpCsSeuT8sxTkMhyW7KRUBHbMQVoxnpX3G+kC+iXU2KZBhVIEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034299; c=relaxed/simple;
	bh=ag82dKCLBuGJieUoZR6gPdwyRNFOjgrDg77CDje6R4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imW1fFG3O1mHZD0Linv4xuL+dcffMIPj25dCdIrOt2gJn6CGN11AmqqOj/xe4peRQibnVRv0OttnrdNVV3t8HfDdVWUglxp56Nu3M6I7ihL9RQeBYtvjqskicQo6sttQr+sPzMSOwWPUuwutivF7rXyY1Y/4iakgwZTumxMMfdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqxDxo1z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OnDHMlxL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqxDxo1z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OnDHMlxL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F0RHaP1672218
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 03:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ktz8pKYAp7Jr4o62hOXKmo5XplGrie5iV/yiquu36fs=; b=IqxDxo1zoUkdDsRu
	nD2P8leOjQfDMpWF4zYSCeHw+N2dabsExZ7vnT/jB0Ew5VpRyzY98gF7OvzwxtEq
	iyza5R00CfaX280tm7012ySf5h3x0FhK8gYzlkWyP6VQYd51f1BKN+fJiYkZBKTj
	PzsseSDaqCqfwEqQncCHYPS8SWmD0CFZ5RxqYjTzqVJWorg0hc/3sl37oMLut0tI
	NOwxU8AsHZDwWgjEgu/AAqwvLDFRn2AcgUhD5E6eC9e7XdqBHXoOE5kiVA4dJzI1
	EDdi+XNR3ZMimstzDcTwhhxCBOfYZPpa8K26BocldFZvkvkOalcSNxYLsci5p1Vk
	21GMwA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrha8aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 03:18:09 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-149e8e8ad71so5464930c88.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 20:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792034289; x=1792639089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ktz8pKYAp7Jr4o62hOXKmo5XplGrie5iV/yiquu36fs=;
        b=OnDHMlxLaNH1D3bonIylz+UDg317nAvyMrVO7Qxe2mVA6E4bODEXuXyy19TEs6PP2u
         lZDpPhIGavx6VyvpPFBHgQvOhZJv2+MBbnhyYzMsdYsl95t1pztgIyzmchvHGcn+qMQB
         BiEdOJ1CswTrRxVQwhEIOlX365IJBRRknihalBjav1H02mIdGgx8aSciTTdQAIblYDyk
         /bH5G8kls5cLX8F04MlP/xAPL3dN3IoGKPqHBI7ACj4znoypLTkJTrlm1oeRUpx//iaf
         Ozmon8Tt72W2/6yqhm1V0Z+8pPM11w4gFUc6Sm77I7Z0vOBPmRZcLXRNKLLNvcnJ3O9X
         NwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792034289; x=1792639089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ktz8pKYAp7Jr4o62hOXKmo5XplGrie5iV/yiquu36fs=;
        b=ZkyE0Csn7Aoi1Astuxzz4dt1ppCAjIKf/HGqy5MYjXZdFjNBvJltN0EaZtVWi8/QeV
         nFhZVPjqATbKX7KYqw9BOgOMqFTOz/qIztAfLCPVb+XwEhnUQhmUBK+LQsVTQ2/GY67B
         qbnHJLTwHxUaN3oynE/JxWzXhSELmq9vN76e9O6DMpLOH4Z0m7k/Atk3DNftWCKCSntp
         FBl3rHvH3D+MlnFIUylCyxTpcW8nnOcYD9wbHKNHGWoiJcOAeAiq9Z8FTnz+4ikaLTLE
         tHVo5Z4TaLa/HeBXF+3GLDBPAqdtJw8MolxwbFaZepVIxIZP/Is9/XJi2NpyoBFl6+Rh
         2+hg==
X-Gm-Message-State: AFq9FYIJmLLZIJUXt/+0KsVByja2uHeK+WTJx2wS/RW1IjDbDUteReyS
	4AMQL0SeIqtyyAFDm7K/7jI8AKOwVQXJLTmmMK5KzbQkpZa3ckf5aldWxdni1tpeQ3lqdoenwHz
	Y6DRhp9xdU7JB36Mb5a7lHy0fZJXqSpc8lBQWlkA1GZSWGvl76rJFiKqERnjS3qc=
X-Gm-Gg: AYBFou15YqXd8nYe7+HrC6Oe1Tq7uRWRRQDa3qkUsQyf+8IV09itisJBHVFlZHt/WcY
	5M7e+uBZ+IzRbBh3HZWwRuElUsqwFHbGckQqs+6DJH+X2kV61R6WC7UsLdOQoY6TIUuXwamFr+g
	4EYQlV57BTWiqsQUE62FipfUaxocbUK6UvboSchc4g5vcHUaUtPq5BuDCBesmbCXn3SI0TP8ypu
	szCGvWFGO0kAz799LJvNn6AN7I0ZHAVoyWIwiQLIlIU9wbYWsux8VO1bVdOcU2tF4tUNsgxAvy2
	eJ+/VkxjJXZdZVYGJEE1FE675rb/0MhvohfZAIWTbHnb2ri9Tnr9LmpVfTO39iSg8ErkgzBHAST
	HFIWmFdbwAhQokNwbqB3ImK5rjY08R229VeIiHmeAKP3iusy1wOZjsgUrh5VRC+Sg
X-Received: by 2002:a05:701b:2314:b0:165:55e2:2d69 with SMTP id a92af1059eb24-17faa57940emr2124282c88.46.1792034288887;
        Wed, 14 Oct 2026 20:18:08 -0700 (PDT)
X-Received: by 2002:a05:701b:2314:b0:165:55e2:2d69 with SMTP id a92af1059eb24-17faa57940emr2124260c88.46.1792034288208;
        Wed, 14 Oct 2026 20:18:08 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm15117170c88.6.2026.10.14.20.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 20:18:07 -0700 (PDT)
Message-ID: <526b4857-4a4e-4ebc-a367-bdcf9a9c9a53@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 08:48:03 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
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
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <atAuSs9VTveGwzpy@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hE-x078btE1Ta3BLgbc5NgCtkG1XiVzf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMiBTYWx0ZWRfX7kVmGlOxVeIA
 rUa8dK7YWja2htdKSxhRZJD5B8Z44r2VcaCHGvd9SlbPuUQxD0U8KA5BUNVgN2Gd/bY/3/cwe3v
 sQhj7wwA1U8MZoKc/4n7FWtiGIrKPOg=
X-Proofpoint-GUID: hE-x078btE1Ta3BLgbc5NgCtkG1XiVzf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMiBTYWx0ZWRfX+E4Smb+Zlq05
 ZN/QorXjwdZXD9hyZ7DymO5eOBlzGiX5mtoIt9gNlh84m+A9O2FwicH1HjFTMMRv28t43p0+v/u
 oHUzL2KPphsVsBoipIJIa9+NV4x6eLJL2JINWVhpqCq6ouNva0vH2GYNPj7vqtDjtmcSc7PSesi
 +rWowU1dLCesRim/hrJ+2Sg//bNjcu2y9AT4LhSaJ1DVYpc/+Jqmy1EECud7qiU/+xyr4rq2uT4
 /7enbvSIVNE5wcbb41aBpWnCubL47s9903p/ibiZoS57zC4WGy5i5HzSu6cUpRlcIufULhpxgmB
 9+R7n8yosCPzFYDdstuFePig//XdnK0xTiqMyw91BoBPBb8THagtBt32ZC1SEC5GGqknPsEgxkO
 3tcgBpw9464mgpJsULfY7lJVbNDzOh/VT14JmF86JXfiuvnb+miXvYsLRk5reUbeMmQfexHQw1j
 XDmyHYlsXC2yqa4HzYg==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad045f1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=o0X_lvrlZip2L4zhhLcA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150012



On 10/15/2026 7:42 AM, Thinh Nguyen wrote:
> On Wed, Oct 14, 2026, Krishna Kurapati wrote:
>>
>>
>> On 10/14/2026 7:14 AM, Thinh Nguyen wrote:
>>> On Tue, Oct 13, 2026, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 9/29/2026 10:49 AM, Krishna Kurapati wrote:
>>>>> During plug-in/plug-out test cases, it is sometimes seen that no events
>>>>> are generated by the controller and all CSR register reads give "0" and
>>>>> CSR_Timeout bit gets set indicating that CSR reads/writes are timing out
>>>>> or timed out.
>>>>>
>>>>> The issue comes up on different instnaces of enumeration on different
>>>>> platforms. On SM8550, the debug log is as follows:
>>>>>
>>>>> Prepared a TRB on ep0out and did start transfer to get set
>>>>> address request from host:
>>>>>
>>>>> <...>-7191    [000] D..1.    66.421006: dwc3_gadget_ep_cmd: ep0out:
>>>>> cmd 'Start Transfer' [406] params 00000000 efffa000 00000000 -->
>>>>> status: Successful
>>>>>
>>>>> <...>-7191    [000] D..1.    66.421196: dwc3_event: event (0000c040):
>>>>> ep0out: Transfer Complete (sIL) [Setup Phase]
>>>>>
>>>>> <...>-7191    [000] D..1.    66.421197: dwc3_ctrl_req: Set
>>>>> Address(Addr = 01)
>>>>>
>>>>> An XFER NRDY is received on ep0in for zero length status phase and
>>>>> a Start Transfer was done on ep0in with 0-length packet in 2 Stage
>>>>> status phase:
>>>>>
>>>>> <...>-7191    [000] D..1.    66.421249: dwc3_event: event (000020c2):
>>>>> ep0in: Transfer Not Ready [00000000] (Not Active) [Status Phase]
>>>>>
>>>>> <...>-7191    [000] D..1.    66.421266: dwc3_prepare_trb: ep0in: trb
>>>>> ffffffc00fcfd000 (E0:D0) buf 00000000efffa000 size 0 ctrl 00000c33
>>>>> sofn 00000000 (HLcs:SC:status2)
>>>>>
>>>>> <...>-7191    [000] D..1.    66.421387: dwc3_gadget_ep_cmd: ep0in: cmd
>>>>> 'Start Transfer' [406] params 00000000 efffa000 00000000 -->status:
>>>>> Successful
>>>>>
>>>>> A bus reset was then received directly after 500 msec. Software never
>>>>> got the cmd complete for the start transfer done in status phase. Here
>>>>> the RAM interface is stuck. So host issues a bus reset as link is
>>>>> idle for 500 msec:
>>>>>
>>>>> <...>-7191    [000] D..1.    66.935603: dwc3_event: event (00000101):
>>>>> Reset [U0]
>>>>>
>>>>> Then software sees that it is in status phase and we issue an ENDXFER
>>>>> on ep0in and it gets timedout waiting for the CMDACT to go '0':
>>>>>
>>>>> <...>-7191    [000] D..1.    66.958249: dwc3_gadget_ep_cmd: ep0in: cmd
>>>>> 'End Transfer' [10508] params 00000000 00000000 00000000 --> status:
>>>>> Timed Out
>>>>>
>>>>> Upon debug with Synopsys, the root cause is as follows:
>>>>>
>>>>> During any transfer, if the data is not successfully transmitted,
>>>>> then a Done (with failure) handshake is returned, so that the BMU
>>>>> can re-attempt the same data again by rewinding its data pointers.
>>>>>
>>>>> But, if the USB IN is a 0-length payload (which is what is happening
>>>>> in this case - 2 stage status phase of set_address), then there is no
>>>>> need to rewind the pointers and the Done (with failure) handshake is
>>>>> not returned for failure case. This keeps the Request-Done interface
>>>>> busy till the next Done handshake. The MAC sends the 0-length payload
>>>>> again when the host requests. If the transmission is successful this
>>>>> time, the Done (with success) handshake is provided back. Otherwise,
>>>>> it repeats the same steps again.
>>>>>
>>>>> If the cable is disconnected or if the Host aborts the transfer on 3
>>>>> consecutive failed attempts, the Request-Done handshake is not
>>>>> complete. This keeps the interface busy.
>>>>>
>>>>> The subsequent RAM access cannot proceed until the above pending
>>>>> transfer is complete. This results in failure of any access to RAM
>>>>> address locations. Many of the EndPoint commands need to access the
>>>>> RAM and they would fail to complete successfully.
>>>>>
>>>>> Furthermore when cable removal happens, this would not generate a
>>>>> disconnect event and the "connected" flag remains true always blockin
>>>>> suspend.
>>>>>
>>>>> Synopsys confirmed that the issue is present on all USB3 devices and
>>>>> as a workaround, suggested to re-initialize device mode.
>>>>>
>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>
>>>>
>>>> Thinh, Can you help provide your review on this patch.
>>>>
>>>
>>> Hi Krishna,
>>>
>>> If the CSR_Timeout bit is set, why not check GSTS.CSRTimeout directly
>>> instead of indirectly checking DEPCMD type mismatch?
>>>
>>
>> As per discussion on [1], implemented this checking of DEPCMD registers. Let
>> me know if reading GSTS is a better option here. Will send v4 accordingly.
> 
> At the time, my understanding was that all register reads return 0 in
> this state as noted in that conversation. However, based on your commit
> message and the databook, GSTS is still accessible and CSRTimeout is
> set. Also, on CSR timeout, the read data is residue from a previous read
> and isn't guaranteed to be 0. So the DEPCMD read back isn't reliable.
> 
> Can you check GSTS.CSRTimeout after the CMDACT polling instead?
> Something like this:
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index ee837235630a..ff4957a7311e 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -283,6 +283,8 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
>   	return ret;
>   }
>   
> +static void dwc3_schedule_err_recovery(struct dwc3 *dwc);
> +
>   /**
>    * dwc3_send_gadget_ep_cmd - issue an endpoint command
>    * @dep: the endpoint to which the command is going to be issued
> @@ -432,6 +434,14 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
>   		cmd_status = -ETIMEDOUT;
>   	}
>   
> +	reg = dwc3_readl(dwc, DWC3_GSTS);
> +	if (reg & DWC3_GSTS_CSR_TIMEOUT) {
> +		dwc3_writel(dwc, DWC3_GSTS, DWC3_GSTS_CSR_TIMEOUT);
> +		ret = -ETIMEDOUT;
> +		cmd_status = -ETIMEDOUT;
> +		dwc3_schedule_err_recovery(dwc);
> +	}
> +
>   skip_status:
>   	trace_dwc3_gadget_ep_cmd(dep, cmd, params, cmd_status);
>   

I don't have the apparatus to reproduce this issue at my end currently 
and extremely difficult to reproduce at customer end. Will send this 
diff along with your suggested-by tag if that is fine.

> 
>>
>>> Also, shouldn't we return an error code instead of success if need to
>>> schedule recovery?
>>>
>> I think that is done while queueing recovery work:
>> dwc->err_state = DWC3_ERR_RECOVERY;
>>
> 
> That only blocks new requests. The current call still returns 0, so the
> caller still sees the command as success.
> 

ACK.

Regards,
Krishna,
