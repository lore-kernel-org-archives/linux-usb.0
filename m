Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0F23B7B7D
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880833; cv=none; b=UJOjgl+hZ0XQC6MXZ+8Unl4EpRVjyDn3xZqABNKW2NgNi8Gv0yIklGRzbyEpL8cAKDGkDxA5lLAwvrD8cJGBE5nTp79iRP5jrb9JT3JR/LqUPWrOn+uD1UegoECK6DKPzYkiv0NFOsWEfzZEh8piOloYXTnlDNukFvCjonNJTIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880833; c=relaxed/simple;
	bh=OZ0rBKPUBUtzAx7rkNnsmO9e2E4kN3VVQzOi15y/PpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hq4Sjqs2xTpB0fTuqxetAaS6f6cxWkzRCkYa5TDNVmo8mQQkkoe30gw9CxHmyVv8eXPU5Zt2sAG/zp/l9tNlxcyktd0uV3UxNjqP5N3SwuVaVGCwHofhTspoI1H1ASzomway5tXJeqCCIXCb/GbYZwsDckpS1qW/Y6Ng+Tg8Vo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6RX58Gw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFd3rDdF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6RX58Gw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFd3rDdF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8MFX7924262
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 08:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdUu7Kx0ACmbiE6IOF4TR0THgSctY7zk974rox1y+GU=; b=D6RX58GwmR+INQh3
	TkTkttfL0MwthMRb0rTBvbBxUeRH0jVqV09z9VT/n/8uQOKuaVj/pV9MddCkJWyW
	S5egCw5aqHY0W9Ndq/SLARmBn5K28PW9j/ohv+RGgDf9SN/InI368vLbo70e8+m0
	p0rE27kqxI3yPKpvmzhZTf4Fm4SoqeEqoVo+mNgyChb09j32P5rr1w3bBpqmuvEC
	/Y1cpuUKMakvrr0u4AXQLJJRM2O8DksFvWYJ3jZjHtK3lYqyTV5NCzd6+w5G5bih
	T3D0a4RvPyHJcDdcit3APxvv3EgTkO+HnPpBhmG4yHmHku4WaZhCfyyYwSvYiEeK
	8R02NA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1t04f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 08:40:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a4d2e39acso7125497eec.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 01:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880829; x=1792485629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdUu7Kx0ACmbiE6IOF4TR0THgSctY7zk974rox1y+GU=;
        b=UFd3rDdFTaHHRTYguRFGPG4wA/qPUKdWRRGYYzWwA6cWYNChv7E98+1acbrQp2Jwn8
         +YWEV99sVGEF5KhFtyeZbODXKU7oyGICgidbuzECWsKTFAt2zQf/pnkbYS/dYex+tCoM
         +8ZwWetSc1reCp4jNKrFyib5Fvy65J4r66pNBwO/sGjnhWt2n5FNMFrdt2EgQ5dQgyYk
         HQO/l2M8gzOp+fCajxSkp+j6AEm+GM61Fp4qUFhiAkB5jDnODIwoNqJpGfqgI2ZGqky8
         GGtrVa5m0TTRH+2GUFyrJKNCDcvbmg5Swmeu8XsoiE8yYlN/hTxRwGQVF+CLV/sHnfOk
         y4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880829; x=1792485629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdUu7Kx0ACmbiE6IOF4TR0THgSctY7zk974rox1y+GU=;
        b=t7OLxZxCunicHZYNMgQr9os2EyF3WY72RGgqIdu6vdhHlu9e6pvYHdbdfvk6SIP0sd
         X1rIIgNb4FA3id8gIwh2MTrAf8iWJmhBSAXxgexee5qNmA5xNPHJfSyhBalpxNJT84cu
         2UKzHhw9FqatMqkkeZnjxt2esclTfTf8r1fiAR2Rqks3BVySb7ptMzBwNRMg9d+guOzr
         KtizcjPNiiy5+W540ZfZfhSrXvP1eTlZfX851HbBhr+qAQzf5bDmuneKjsdpPSZEljWF
         xc7ruLoW4SZKP52mCROtEbF14ILOPtOsq1Vi10fnye7sgttRMbQb4x74xBzFsXcoJEGV
         uEew==
X-Gm-Message-State: AFq9FYIXnLSkPlCt0vqcKD0BaXp5+aHQqYXq18IoMTTdlyqfez8DEZlN
	BRSbSciBXYT/2skMXnLMHYTYF9vcqrzXlSAyefCjYHi6S6K5GyRVSZY2mMF7/W6qS57Vb2ovYNi
	Wjzf+taaaOz7Z5Tr8jyu4uBKMzoXAGHXS6iGdV8eAGiiwnUcdsxtAp9b+Lwun5s4=
X-Gm-Gg: AYBFou08VLpmD8yYIbZQiwoIDdTC0GkVqk7yTtM0dr+ivrSZ4ltSpsyEEpORO8aGmPf
	MdukTJfnqWd/qfKzuT9v8w4h2W0xQHxWVigkeCUW6lDi7Kup+neKjIogJaBlfSRxwdoShriPrkS
	vLoBZmMYhooX0t4Ho9jmcPTFZ6iDPs0soAkK4yL83FC8bIqbrqIsqdGQU+f+h4/YX17Ig/dUCqg
	jO6fuM7436+1hmciFj9hzM521D7rs/Tc66w4Cvp+QGI2BUplnIpfgodD7PcH+/v4SPxKoWKWNsQ
	g4DFTp1luk9qYHlcfkJKLYvMGKdf/yussb5a912MhJlp1PknJM+h1lTYYXSRc0Y5Y8rWYE6ouL0
	G5CMyPvmq/3+OcFsqFRZs2+lQi4PIP0EansBLZPRXOlbkamca65SZcezOoxwOPcGx
X-Received: by 2002:a05:693c:414b:20b0:33e:a0c3:4163 with SMTP id 5a478bee46e88-3537e00907amr18208680eec.24.1791880828593;
        Tue, 13 Oct 2026 01:40:28 -0700 (PDT)
X-Received: by 2002:a05:693c:414b:20b0:33e:a0c3:4163 with SMTP id 5a478bee46e88-3537e00907amr18208649eec.24.1791880827896;
        Tue, 13 Oct 2026 01:40:27 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1ba7esm40879434eec.7.2026.10.13.01.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:40:27 -0700 (PDT)
Message-ID: <d45f758a-8d00-4f76-aef9-7364156f4ce3@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:10:23 +0530
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6acdee7d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cSAlzBlaUu0bmXACLXkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: QTZ6MBU-UHt9fIaJglZnCIna48jnS8ur
X-Proofpoint-ORIG-GUID: QTZ6MBU-UHt9fIaJglZnCIna48jnS8ur
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX7+UeQPeUDgiB
 6lpmMKYg0v7WmR0aBFO4cwC3VFu00n7B98g5Hn4BCqkPceV5MO2F0iPkjFCFnBi410P6FCu7Nqm
 Kj0RefP62mmKo5VLs1+clwMmickvbdo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX+LZ4YgIwVYlJ
 qx9zlE0/afDBaPSfkIh16WIoAeVjQ+uszYN3deprAUi3auYAXTr/kJZz428BAeHgwXvY5O56v1H
 dsHXKqR8Xv16+b4C2oc7n19cIcYQMtNMTRsEwuPE8usUrEu0VMhQrcUhE84Y1KIAjS+HXc3hIwW
 z5f0vMvJK2qdpUG0UYM9wW4bQqeCz8PvCjLvwdR3LbmdfZUIeL84w1ISYL2eEog8ZTm3c2wclyd
 KzcGNVMWMt46PNfu/nB6T1WZShZpAj5+GZunFg6aPCGleRFwRH056YxMHxbzMMLL2mSTOA714ch
 oFBy6d1jTQZI6BtinsT6MIkMkGEFgDtkR80U0WUfA799w8OsIEZpf8cY1h9gnHrQw7mXjOXGuTU
 vshGAD83bDlJ6mBW9kQU3Bc4OCjVAz+5cjxIm8syAi2HJzITDmW0MxCmzOIJYCgr7pELIfL7+wH
 zQ3pcWB80Xwv5pfveUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034



On 9/29/2026 10:49 AM, Krishna Kurapati wrote:
> During plug-in/plug-out test cases, it is sometimes seen that no events
> are generated by the controller and all CSR register reads give "0" and
> CSR_Timeout bit gets set indicating that CSR reads/writes are timing out
> or timed out.
> 
> The issue comes up on different instnaces of enumeration on different
> platforms. On SM8550, the debug log is as follows:
> 
> Prepared a TRB on ep0out and did start transfer to get set
> address request from host:
> 
> <...>-7191    [000] D..1.    66.421006: dwc3_gadget_ep_cmd: ep0out:
> cmd 'Start Transfer' [406] params 00000000 efffa000 00000000 -->
> status: Successful
> 
> <...>-7191    [000] D..1.    66.421196: dwc3_event: event (0000c040):
> ep0out: Transfer Complete (sIL) [Setup Phase]
> 
> <...>-7191    [000] D..1.    66.421197: dwc3_ctrl_req: Set
> Address(Addr = 01)
> 
> An XFER NRDY is received on ep0in for zero length status phase and
> a Start Transfer was done on ep0in with 0-length packet in 2 Stage
> status phase:
> 
> <...>-7191    [000] D..1.    66.421249: dwc3_event: event (000020c2):
> ep0in: Transfer Not Ready [00000000] (Not Active) [Status Phase]
> 
> <...>-7191    [000] D..1.    66.421266: dwc3_prepare_trb: ep0in: trb
> ffffffc00fcfd000 (E0:D0) buf 00000000efffa000 size 0 ctrl 00000c33
> sofn 00000000 (HLcs:SC:status2)
> 
> <...>-7191    [000] D..1.    66.421387: dwc3_gadget_ep_cmd: ep0in: cmd
> 'Start Transfer' [406] params 00000000 efffa000 00000000 -->status:
> Successful
> 
> A bus reset was then received directly after 500 msec. Software never
> got the cmd complete for the start transfer done in status phase. Here
> the RAM interface is stuck. So host issues a bus reset as link is
> idle for 500 msec:
> 
> <...>-7191    [000] D..1.    66.935603: dwc3_event: event (00000101):
> Reset [U0]
> 
> Then software sees that it is in status phase and we issue an ENDXFER
> on ep0in and it gets timedout waiting for the CMDACT to go '0':
> 
> <...>-7191    [000] D..1.    66.958249: dwc3_gadget_ep_cmd: ep0in: cmd
> 'End Transfer' [10508] params 00000000 00000000 00000000 --> status:
> Timed Out
> 
> Upon debug with Synopsys, the root cause is as follows:
> 
> During any transfer, if the data is not successfully transmitted,
> then a Done (with failure) handshake is returned, so that the BMU
> can re-attempt the same data again by rewinding its data pointers.
> 
> But, if the USB IN is a 0-length payload (which is what is happening
> in this case - 2 stage status phase of set_address), then there is no
> need to rewind the pointers and the Done (with failure) handshake is
> not returned for failure case. This keeps the Request-Done interface
> busy till the next Done handshake. The MAC sends the 0-length payload
> again when the host requests. If the transmission is successful this
> time, the Done (with success) handshake is provided back. Otherwise,
> it repeats the same steps again.
> 
> If the cable is disconnected or if the Host aborts the transfer on 3
> consecutive failed attempts, the Request-Done handshake is not
> complete. This keeps the interface busy.
> 
> The subsequent RAM access cannot proceed until the above pending
> transfer is complete. This results in failure of any access to RAM
> address locations. Many of the EndPoint commands need to access the
> RAM and they would fail to complete successfully.
> 
> Furthermore when cable removal happens, this would not generate a
> disconnect event and the "connected" flag remains true always blockin
> suspend.
> 
> Synopsys confirmed that the issue is present on all USB3 devices and
> as a workaround, suggested to re-initialize device mode.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>


Thinh, Can you help provide your review on this patch.

Regards,
Krishna,
