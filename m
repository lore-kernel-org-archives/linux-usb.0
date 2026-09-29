Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5625B471405
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670967; cv=none; b=s5JHRv0gAVL3B4l28/AwsSr/S3l+8bCGc0ARCAJTDrHqHHV1IuVNlNMNgr4VkADbdqShGtgfB+qMawUs950nJiGn7UCwUJ6aXHoXp8zGcQeYFne5jjg9/TC5ReCgZOdKBde523XxDrxVDebnFz5JQj3iDGH7+qrmx/xmLsVPN8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670967; c=relaxed/simple;
	bh=vDHz0DAqA5MD+CahZEBLaSzq+QTld+VPqz3iHZcp718=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBKJykO6UfBM8+5V9pMOeUeCcjSltJ1CYxPZ21LN+/ayu+ozcf5dQIfzOfFublPEQRGc1/ybvEAnr/k3RJpFdu3KhLUQo2m25nUrqQICUXjwoOv3tr1BHqviE7HJXHu6ZdF1KE5QnI2pfKZdkb1jPdHzVc0jBPXrk37Fbz3UOz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSU2C6Ut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCacsUOQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSU2C6Ut";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCacsUOQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TkoL4097688
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 08:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pF1P5OcHLv/aoX+LRZz7GRT/2F/cIdD0NlBp0emSFeM=; b=aSU2C6UtHw8heWth
	KUMPzrKiDufNk5QyNwPPqy41HRjgrYGpWVGJqpCrEq9pIntoJ5neqIe6/+k1BeJy
	8QD/lwVR5SMwdxfHfnM1yg8Y2DACCLodGs6IWb6zjqHhwCK4cmsCiTkiBTEnCWgr
	Y/u8bfweHWUN/JJ3wDd3ZkS0UAsdfYSiRGOarMs5T0JqIV00oerJeo9QGeCTGmuJ
	B5tCHVqUjvMVY2g65jOusa2zeps/Wg7ePdcLJbvkHqB78ubVGErV0+pK6sK4auNF
	0sOiDbxA6YuQ5hHDaR0ZAPyteeJ4LUqj6O1P7pqsFqSpkskJTA79BjX4O4ibgAXl
	aeh86A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew1h18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 08:35:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1a439db36so2383162a12.2
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790670958; x=1791275758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pF1P5OcHLv/aoX+LRZz7GRT/2F/cIdD0NlBp0emSFeM=;
        b=OCacsUOQuyBQ6d7rv9IzbGyKsCafoX1JehK1pbsV5ujRekAVu9yp8q2+RRvAhTZR+G
         uX57UAUdj/vTeT2FF1n57s584fQOl6AZVN/JXrFzbhlUWq0JAHcqXzCcXA9zcbYbg5zn
         6ZI0f1iee6pkwttuTBd1GHt6nma6eVrtejQOfEnmH+jY4MmwnQmhIBka9xBV/tJtVqV3
         Rv7+vLw55w4LDN3WmJqHm0dwFl9qO6z0yUwGMp5A8TW7WIxBSOokXM614dmoMkA2wvHB
         EHQZ46E8Mfy4IWo6KgzvfAAwZi/Q/H1geXDyv7TjTNn3o+nXL2Tj5YBmBR0xfu5vAXcc
         YB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670958; x=1791275758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pF1P5OcHLv/aoX+LRZz7GRT/2F/cIdD0NlBp0emSFeM=;
        b=Wn/IK50E3tIleqgy1LzwuFq/ldFBBsZTr9g7duHMKp0swdEpiObmEbQAPW4O1vj78N
         CXfLgTYQDe2+DF0MdTpjQXFQ8nHgl3RTlNwmxl9PCrKDxF4cN9mxCbPFswYXqFANWhWl
         gw+oYMvGazXGwHnrmS/xeNl7674b9h3lmjCKChZmXeT5foHZkB+yEc2QYf5Qavmy7nAD
         HJOSWVwikmZ7wDZtZycbnSwZD8aR9gWwgf5XXjMiVl/OZJaWcakVaOGKdYrtcOJImP7j
         FnZr89F4+MG96y78fStW1HBcWYi6H5By6tTha33FPYw+Xh6iHPDlkapb8bHKf/hq7xg0
         0/Gg==
X-Gm-Message-State: AFuF++n8R8lr0q4uPhqC3w5YBWKOkuVRNLKwJ/bVZIo5QUk6VG78HiPj
	tx/kqT28c2sgX1KSSqvsHb9j9wQzeTQNZZmKjjT4oZZ6EiUbIlK2NgyxS69JEEwQle8xcU6kePH
	W9pK6mAhLMH66A13nQUYgLUvbuazD/yDllTHquLjJVj5dQf5+lDK/p+XFveiU8Ns=
X-Gm-Gg: AYBFou1MxWmfhz45LfPrqNj9teYmTN+5VtZSpILwqEEzL6mu/e9BEtQZygagDhiX2Ng
	xCs9HSAKEZI+JpB0jL2NB+P5YiOuC6FUqG72nCy6OPz0ANcg9C4mJI+LbzPkBmyLZbCAJ4walVr
	J7P4iTPCbUtsJSUHbFkPBGMgzT3OuSUx3Jr3hCN6nYZejeFok/bw2SqgzMDFchBuGvGJFklhIfA
	PMBiyOo3+9ILidJB5mTJ6YQwc1oBq9CZSy4TMLt3HBvUHQ1nAp+b/i/OhyyNy2Bw7tEZRKT0B++
	0alwH8LJpGj1FZkoYidH+KVRv18ABAUxcghr1CM1mIySzQIY5et6hA7DLwgPcLrsJpb+KpRdisr
	5AhcVdWi8N9c03CHc+kvhIPsEYZpciyh8BGD0FqtNNFOy93gysXNnTAdFN6/F6yp3
X-Received: by 2002:a05:6a20:3946:b0:3da:15a9:a18e with SMTP id adf61e73a8af0-3de0e6c295bmr13747112637.23.1790670957550;
        Tue, 29 Sep 2026 01:35:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:3946:b0:3da:15a9:a18e with SMTP id adf61e73a8af0-3de0e6c295bmr13747092637.23.1790670957021;
        Tue, 29 Sep 2026 01:35:57 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885defd8482sm417972b3a.7.2026.09.29.01.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:35:56 -0700 (PDT)
Message-ID: <647d8c0e-9323-4b1e-9720-9e51ea8e3227@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:05:52 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
To: Selvarasu Ganesan <selvarasu.g@samsung.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <CGME20260929051941epcas5p27a5c69151937b9105660941776cda819@epcas5p2.samsung.com>
 <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
 <e8b9b694-0ba5-4d0f-97c9-ceeb89ae4729@samsung.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <e8b9b694-0ba5-4d0f-97c9-ceeb89ae4729@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfXzUNPQ9DA0D8Q
 QTHQtj2y9Ish64Bd7NKp3yaoNUBCpTXMUccyG5cp5aQloASHmkNxhzlN3Nz5i+r0LviYLOxMUMe
 fykISNhhawV5J52wKTgW47MuL+6nXrI=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb786e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8
 a=zJHVBnBqPTMeYmh37F4A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfXxMoO5/KrktpA
 Pt/59UYMDIAVP6Gasvo4B8JbuA349em1zwU1KYoA/llHqOfO+8hvAx/PoQaawnlsMgZWIQfNNSU
 /l/xoCRn4nNUM0bvi/37Hb/XUawhw8pBCV3P6VHpwzjJPc8txhYJsbEYqQk+PBQ2HW3LX1sZPaO
 4Ydzu+sE9hRyLNrdu1zJmeO7szjSCPr6GEKPEq/auIwEzSyFpbRxEfDSew7BV2sC772FBCifmHV
 d3RcckQ+p6GPTS15AHQ/LVhDI2kNxfrXcrKmY7gfn71/Q5LeQtJZPx8CsJ8bpEyendUPwoHJa2/
 i0VzguyNa5rgUinCu7YhfgdNLVEVP8nmYYiYqnThMMoucLeVadx8m4XToBveTigDCu5VZ0kDCxA
 WkXwYwOIAm+svepdotZO/XtajJoicakFPs8LFezzdaw2MJ8j+ncjMTrtz2S5a6Uv+Udt5M94oq9
 oeNlSUYI/CU8jyDOn1Q==
X-Proofpoint-GUID: LOtcgfs2A3k2WHrbYYnPsn7_71I4X2PI
X-Proofpoint-ORIG-GUID: LOtcgfs2A3k2WHrbYYnPsn7_71I4X2PI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290034



On 9/29/2026 12:15 PM, Selvarasu Ganesan wrote:
> 
> On 9/29/2026 10:49 AM, Krishna Kurapati wrote:
>> During plug-in/plug-out test cases, it is sometimes seen that no events
>> are generated by the controller and all CSR register reads give "0" and
>> CSR_Timeout bit gets set indicating that CSR reads/writes are timing out
>> or timed out.
> Hi Krishna,
> 
> As per our discussion with synopsys we got a below feedback for CSR
> timeout in different issue.
> 
> "Note: CSR timeout is not expected to occur during functional mode. Once
> timeout is reported by controller, s/w should treat it as a fatal error
> and should identify the root cause of issuing the parallel access during
> soft reset and fix it"
> 
> As per our understanding, there is no recovery from CSR timeout.
> 
> Are you able to recover from CSR timeout in your case even after trigger
> controller recovery?.
> 

Disabling and re-enabling gadget mode is the recommended fix. I did not 
test this particular patch as mentioned below, but this error recovery 
mechanism does the same thing as a soft_disconnect followed by soft_connect.

Regards,
Krishna,

> 
>>
>> The issue comes up on different instnaces of enumeration on different
>> platforms. On SM8550, the debug log is as follows:
>>
>> Prepared a TRB on ep0out and did start transfer to get set
>> address request from host:
>>
>> <...>-7191    [000] D..1.    66.421006: dwc3_gadget_ep_cmd: ep0out:
>> cmd 'Start Transfer' [406] params 00000000 efffa000 00000000 -->
>> status: Successful
>>
>> <...>-7191    [000] D..1.    66.421196: dwc3_event: event (0000c040):
>> ep0out: Transfer Complete (sIL) [Setup Phase]
>>
>> <...>-7191    [000] D..1.    66.421197: dwc3_ctrl_req: Set
>> Address(Addr = 01)
>>
>> An XFER NRDY is received on ep0in for zero length status phase and
>> a Start Transfer was done on ep0in with 0-length packet in 2 Stage
>> status phase:
>>
>> <...>-7191    [000] D..1.    66.421249: dwc3_event: event (000020c2):
>> ep0in: Transfer Not Ready [00000000] (Not Active) [Status Phase]
>>
>> <...>-7191    [000] D..1.    66.421266: dwc3_prepare_trb: ep0in: trb
>> ffffffc00fcfd000 (E0:D0) buf 00000000efffa000 size 0 ctrl 00000c33
>> sofn 00000000 (HLcs:SC:status2)
>>
>> <...>-7191    [000] D..1.    66.421387: dwc3_gadget_ep_cmd: ep0in: cmd
>> 'Start Transfer' [406] params 00000000 efffa000 00000000 -->status:
>> Successful
>>
>> A bus reset was then received directly after 500 msec. Software never
>> got the cmd complete for the start transfer done in status phase. Here
>> the RAM interface is stuck. So host issues a bus reset as link is
>> idle for 500 msec:
>>
>> <...>-7191    [000] D..1.    66.935603: dwc3_event: event (00000101):
>> Reset [U0]
>>
>> Then software sees that it is in status phase and we issue an ENDXFER
>> on ep0in and it gets timedout waiting for the CMDACT to go '0':
>>
>> <...>-7191    [000] D..1.    66.958249: dwc3_gadget_ep_cmd: ep0in: cmd
>> 'End Transfer' [10508] params 00000000 00000000 00000000 --> status:
>> Timed Out
>>
>> Upon debug with Synopsys, the root cause is as follows:
>>
>> During any transfer, if the data is not successfully transmitted,
>> then a Done (with failure) handshake is returned, so that the BMU
>> can re-attempt the same data again by rewinding its data pointers.
>>
>> But, if the USB IN is a 0-length payload (which is what is happening
>> in this case - 2 stage status phase of set_address), then there is no
>> need to rewind the pointers and the Done (with failure) handshake is
>> not returned for failure case. This keeps the Request-Done interface
>> busy till the next Done handshake. The MAC sends the 0-length payload
>> again when the host requests. If the transmission is successful this
>> time, the Done (with success) handshake is provided back. Otherwise,
>> it repeats the same steps again.
>>
>> If the cable is disconnected or if the Host aborts the transfer on 3
>> consecutive failed attempts, the Request-Done handshake is not
>> complete. This keeps the interface busy.
>>
>> The subsequent RAM access cannot proceed until the above pending
>> transfer is complete. This results in failure of any access to RAM
>> address locations. Many of the EndPoint commands need to access the
>> RAM and they would fail to complete successfully.
>>
>> Furthermore when cable removal happens, this would not generate a
>> disconnect event and the "connected" flag remains true always blockin
>> suspend.
>>
>> Synopsys confirmed that the issue is present on all USB3 devices and
>> as a workaround, suggested to re-initialize device mode.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> This series has only been compile tested. The issue was reproduced
>> easily with a certain kind of cable and CDP port of AMD based Lenovo
>> laptop. I don't have access to the cable currently and hence only
>> compile testing the fix for now. But the issue has popped up on OEM
>> testing as well.
>>
>> Also, didn't add locking while calling error recovery work in
>> gadget_ep_cmd since the caller is supposed to handle it.
>>
>> Changes to v3:
>> - Using error receovery mechanism from [1].
>>
>> Link to v2:
>> https://lore.kernel.org/all/20260806-ram-interface-code-v2-1-fe4a0de31d42@oss.qualcomm.com/
>>
>> Changes in v2:
>> - Implemented gadget recovery mechanism during gadget_ep_cmd instead of
>> handling this issue only during disconnect.
>>
>> Link to RFC:
>> https://lore.kernel.org/all/20231011100214.25720-1-quic_kriskura@quicinc.com/
>>
>> [1]: https://lore.kernel.org/all/20260915110637.17658-1-jiazi.liu1984@gmail.com/
>> ---
>>    drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++
>>    1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index ee837235630a..a7c4514cf0e2 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -283,6 +283,8 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
>>    	return ret;
>>    }
>>    
>> +static void dwc3_schedule_err_recovery(struct dwc3 *dwc);
> 
> Where is the function implementation for this function?. Could you
> please point me on what you are doing in this function?
> 
> 
> Thanks,
> Selva
> 
> 
>> +
>>    /**
>>     * dwc3_send_gadget_ep_cmd - issue an endpoint command
>>     * @dep: the endpoint to which the command is going to be issued
>> @@ -432,6 +434,23 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
>>    		cmd_status = -ETIMEDOUT;
>>    	}
>>    
>> +	/*
>> +	 * STAR 5001544 - In some situations, like the cable is
>> +	 * disconnected or if the Host aborts the transfer on 3
>> +	 * consecutive failed attempts, the Request-Done handshake is not
>> +	 * complete. This keeps the RAM interface busy.
>> +	 *
>> +	 * The subsequent RAM access cannot proceed until the pending
>> +	 * transfer is complete. This results in failure of any access
>> +	 * to RAM address locations. Many of the EndPoint commands need to
>> +	 * access the RAM and they would fail to complete successfully.
>> +	 *
>> +	 * If the depcmd doesn't match the actual command, trigger controller
>> +	 * recovery.
>> +	 */
>> +	if (DWC3_DEPCMD_CMD(reg) != DWC3_DEPCMD_CMD(cmd))
>> +		dwc3_schedule_err_recovery(dwc);
>> +
>>    skip_status:
>>    	trace_dwc3_gadget_ep_cmd(dep, cmd, params, cmd_status);
>>    
>>
>> ---
>> base-commit: ab29ca7714b82485ebb31d66835ccd5364221a76
>> change-id: 20260929-ram-interface-stuck-v3-aaf0c4b13b98
>>
>> Best regards,
>> --
>> Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

