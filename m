Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359506;
	b=FPTKY6+iNDdmLkC9Rijtj/71Z//gF1mT59B4HEXOSf8PkHur/IAOXuWc4fh2gQPezQWF
	 dHzpPnxdIsohsfw4D8WJ882RG+f3bHkHju8el0fWJekOQ2u1XTi4YK9o8zVqYCoWiepii
	 3eiJ7SrxKEJkQP2iYWztNttUpqGrVyENoF9W9Vfxb2rI2nzYtwgo31xwelswRNtJE/obc
	 Uk5N83bND8XjCjScVX5t3BsHAusqCQG+NortNaRAHG/bPpRDSxizlQdVFnJ5dxjK3mzYL
	 MDU/0BqGaZ1afUsEB7xswGN9nfdW3BEeeba2N53xnuX8vEA9rJyRnSFsonP5W7mMXRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tdbx0dHYIyp69emOWIEzNw41iQHntBCECrGFrtburSQ=;
	b=32MrA3Ynb6HOTnc0+By8v3n60r52bMD/khhakLU9gBBsnn3ZwpRgdIKspheWH5yAbyi3
	 N5JYt77FfwtbzTW8ow85daUiZL+tFA6CA+JctAQmAwBHh8zpnnQJEeNgP92trOW9NuWxh
	 H5WvDWboqIuCfiBTnuBpHnCvAW3lvTgRNYaiU6kf9I7EffjS2Lw6xoPxkxjiUT9iR5xuk
	 bGSP8bUVlLlwVfCfbumI88QG37w0zJlGF/us7qK4pKF3PVsz6exeiwOXdOZYDlGfxlyZS
	 TWM94FSbmjiyKdlAb4h76cUKUCA2JgkeB5b0xO8/z2GGdWltUoMRnMusLeRo37oMDiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6Q06qH8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MthHSyok;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECAA606A31F
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 11:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ECAA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6Q06qH8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MthHSyok
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG4pI3142133
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 11:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdbx0dHYIyp69emOWIEzNw41iQHntBCECrGFrtburSQ=; b=F6Q06qH85YmQbRp/
	mAovKzDurDlFMxNV21b93Z/D+NsjJSl7nznr2xlXGIagBnsvB/EXPJ92V6Rl1bf5
	5wu/gsVUWrVJHCRggG7tYo14x+AOqvIJVdKtsk4AhkD++8c54UqMdaS0x3WjLhg/
	rcSIW8pc7acgP5FloK/TjFXrXHeJ/LreuGQj3MuawAkFopP+/r+ea0bO4wj0KhX4
	013/PVbndtHn5QXQPL6Dak5VwD4o6P9+/ohFR2MxyY3gPioyA4Ox65kUxahYmnPw
	DHaB12iLFtFvHaRkKEiEy7bbYfsYpdprO2qarXLR9Evi6EsdSuA2euMx67Mly80y
	/4cYmQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjqab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 11:25:04 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so2179189c88.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793359503; x=1793964303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdbx0dHYIyp69emOWIEzNw41iQHntBCECrGFrtburSQ=;
        b=MthHSyokh/pEjj8ctzTLe0GTxgnt34I/YRpD2kntoyGtC+rLRB/OaqNPkAyHTFsbrW
         kSrZ/xhtFcX4b8OB+4lrve1Tqt/tMaDLqCDKAgi4i5nWIaWo/8Jd8+nfP3qunIgPFZW1
         PXqNCADSSy3ZARgwyjiIzadOToxPlx0g+0oPHJKffajIMCOD+HqF7mxeqSlTwOPXKKZE
         oyXEO3cgxRFYYQUpizG4nEwBMsGj61U0GbKHratCFqgUHGcrjf4gt008T6w6W3zxsc0d
         lPG6XZevu/oUdNCBfKNjndDeYnJZ2rYOCZPd/iVmtN7Uut6oKxvMMGotrAYevMqJqi5Z
         siYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359503; x=1793964303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdbx0dHYIyp69emOWIEzNw41iQHntBCECrGFrtburSQ=;
        b=coYOkMF9YaE6F5Y/v2q/tEZ3tnSohzVxhCbY0ZqTbfHgw1Nimrp4IdwblGhPIz/7Hm
         aukvkxspyQSP67CHGTUVShwQxb7YEPmWCSg4M9uClSqwGclnHJiVzDfT/fBxo76ARlrj
         ETgI7QDIKVGD8EX4sdlFG23lWps9Dhoi7SW4BcxyNtHap8MTBXPQJvxH4XsZ0As7z6hL
         ENITiOS1rOyA1pcLTjtGdsbQYH7OKldyUuXwIQeTBNdwyO8LiF0W1GGUuFdWDABe+QeT
         xJFEldWZJs8820XgmLw3+kxqY90+njN2ybxtRZPD/xNpdfyQNW7yqw5z+sLGtW4PuJ46
         IJcw==
X-Gm-Message-State: AFq9FYIw0a0Cl1hFAivNqaiTo6vM8uOk5iDXcvCXk7J4IPnqe9lcX7bY
	7vijB7sw8kJg4AdvQ/Sj7+OSjsl9XVR6HRLNiFSPW/qVJobGLHXCSdBYy5EJ6BP5mF19/n9yUGS
	zCA/6TjeSKgOJhzMFQwGLxefrHrXeU2z+jFOa9MRlvLp3tZZArqrEsqKa3cktdGsM9JqwQZ0=
X-Gm-Gg: AYBFou2CFSQKFFNBTWpQ2cECxaoTH7panwyk0kikU8QTFUVftYw2LzmavUDggAfiyw9
	5TpJOQHF64iPJbhyMxpyIM0CvG7oagvDvALk6UQUVZVwudeqoEE2dZPrHnt8xTi00ZQiQmwCGJv
	rt8/kQEtQXeqVX8cmBob1tz6pTAeATiOFeswVtdN7nFZQ+gNahj4k5H6a2uGffLxjU57kkNu2F4
	lotsRKDjN6nY8l4E5SfwAZZZQNQFk4PVmqmpQqlsGXbDoINbWOz6SQ7zyefeFOdwln2abooluB6
	BM5ifJNNF9hSn6SYHsQsGvRNvz/X2IuAxLmtl27YoenPMDiK/dBAdG9mPaqUaXk72umKzM/szNx
	+4Rves+x2klBLk+hI0KvMm3rESZjx4GuCYFBWChqatTqBFfr2PpxgpjBa+77F+uXIUkADEbUQsq
	Er5PA=
X-Received: by 2002:a05:7022:d8b:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1ac5c273c3emr2624520c88.35.1793359502961;
        Fri, 30 Oct 2026 04:25:02 -0700 (PDT)
X-Received: by 2002:a05:7022:d8b:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1ac5c273c3emr2624466c88.35.1793359502028;
        Fri, 30 Oct 2026 04:25:02 -0700 (PDT)
Received: from [10.216.63.119] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm6421408c88.14.2026.10.30.04.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 04:25:01 -0700 (PDT)
Message-ID: <c261c442-6623-4087-bc3d-c90afabad9d2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 16:54:55 +0530
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
Subject: Re: [PATCH v4 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <auRiR2synrBgWFhI@hu-petche-lv.qualcomm.com>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <auRiR2synrBgWFhI@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GDQZfTZFoA1S5D4gQuNRYOj0a1YBhXqy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0NSBTYWx0ZWRfX3RmEYAixRLgY
 srySSiuYOwHyrYPcMcA1KKpzYRVQJbIWM6vW23k3AnDg9w+P6KAHWimNUurNNizgwzKjIBGp9z1
 DVqx6V0Cu4Wf3PhO7cTIFIMqQUT17AI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0NSBTYWx0ZWRfXwa/bdXI0fCwI
 R1re+t/doQoaDq0hCfsud7vhqIVS75qIkIRGqpqxX2fXpNq6pBUq56ZVmElAOeXtSpd2ZH4yoQw
 oL61bkhKwLbMSrG2pJxGTPwyw3iV3Si8WxV60385/UhCwGarHPXOAnXJPH1GohFNHwQNfnVIb1v
 MECfXo99vExBcvWR9AkBMlsPAsajU213Qy2TBIic8iwOCX+PS2rvm2lCdQPBMuL01tpS8s3pzPt
 YvyezAoELaGFtgb2rj6peFra4TbmKwqspWmZamT5JujPEUggoa8V2qPUCplExiqH37nBNhD6LHG
 LUcNTPvulytR6KUildeR+RcxdY/tSEa3YyDgSrgn7jMeBPp62UvRvLe1r6aVN09+vqAWWDumYEw
 TPICqfpivk0bBpJufhswuAppJtZOxkM9ZmfL57lYh2KY93svfoSKJEJ2JsieiAtjilKD0BJ1BIR
 xOP1sAl5AsuAJ5Gt5gw==
X-Proofpoint-ORIG-GUID: GDQZfTZFoA1S5D4gQuNRYOj0a1YBhXqy
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae47e90 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TVcAculkLhaLcnG0sCoA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300045

On 30-10-2026 02:54 pm, Peter Chen wrote:
> On 26-10-29 00:29:31, Faisal Hassan wrote:
>> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
>> clocks. If clk_bulk_prepare_enable() fails, it returns with them
>> disabled.
> 
> What's the relationship between clk_bulk_prepare_enable() fails and this patch?
> 
Hi Peter,

The wakeup interrupts were disarmed before the clock enable. If that
failed, is_suspended stayed set, the next suspend returned early, and
the next resume disarmed them again. disable_irq_nosync() and
disable_irq_wake() nest, so each failed resume left the disable depth
one level deeper. This is the rarer case, so I will reword the commit
message to lead with the runtime suspend case below.

>> The next suspend returns early on is_suspended without
>> re-enabling them, and the next resume disables them again, so every
>> failed resume leaves the disable depth one level deeper and host-mode
>> wakeup is lost for good.
>>
>> Re-enabling them on the error path is not safe either: the
>> level-triggered ss_phy interrupt can stay asserted, and the handler
>> can't make progress while the controller is not resumed, so it would
>> fire continuously.
>>
>> Track whether the wakeup interrupts are armed and make enabling and
>> disabling them idempotent. A failed resume now leaves them disarmed and
>> balanced, and the next suspend arms them again. Disarm them in resume
>> regardless of the wakeup setting, so interrupts armed by a runtime
>> suspend are also disarmed when system resume runs with device wakeup
>> disabled.
>>
>> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 20 ++++++++++++++++++--
>>   1 file changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index d44f093ac243..d4fda4dd81f6 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -81,6 +81,7 @@ struct dwc3_qcom {
>>   	enum usb_dr_mode	mode;
>>   	bool			is_suspended;
>>   	bool			pm_suspended;
>> +	bool			wakeup_irqs_armed;
>>   	struct icc_path		*icc_path_ddr;
>>   	struct icc_path		*icc_path_apps;
>>   
>> @@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>>   {
>>   	int i;
>>   
>> +	if (!qcom->wakeup_irqs_armed)
>> +		return;
>> +
>>   	for (i = 0; i < qcom->num_ports; i++)
>>   		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
>> +
>> +	qcom->wakeup_irqs_armed = false;
>>   }
>>   
>>   static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>>   {
>>   	int i;
>>   
>> +	if (qcom->wakeup_irqs_armed)
>> +		return;
>> +
>>   	for (i = 0; i < qcom->num_ports; i++)
>>   		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
>> +
>> +	qcom->wakeup_irqs_armed = true;
>>   }
>>   
>>   static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>> @@ -377,8 +388,13 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>>   	if (!qcom->is_suspended)
>>   		return 0;
>>   
>> -	if (dwc3_qcom_is_host(qcom) && wakeup)
>> -		dwc3_qcom_disable_interrupts(qcom);
>> +	/*
>> +	 * Wakeup interrupts may have been armed by an earlier runtime suspend
>> +	 * even if wakeup is now disabled,
> 
> How wakeup interrupt is triggered even the wake interrupt is disabled? Is the
> hardware default value makes it enabled? If it is, we need to disable all
> wakeup interrupt at probe, otherwise, there are un-expected wakeup interrupts.
> 
> Peter
> 

They are not. They are requested with IRQF_NO_AUTOEN, so they stay
disabled until the first suspend and nothing needs disabling at probe.
The issue is that runtime suspend always calls
dwc3_qcom_suspend(qcom, true), which arms them in host mode regardless
of device_may_wakeup(). The old resume only disarmed them when wakeup
was enabled, so a system resume with device wakeup disabled left them
armed. The comment read as if the interrupts trigger while disabled,
so I will reword it as:

     /*
      * Runtime suspend arms the wakeup interrupts regardless of the
      * device wakeup setting, so always disarm them here. On failure
      * they stay disarmed, as a level-triggered wakeup line could
      * otherwise keep firing while the controller can't be resumed.
      */

I will update the subject and commit message for v5 to cover this case.

Thanks,
Faisal
>> so always disarm them. On failure
>> +	 * they stay disarmed, as a level-triggered wakeup line could otherwise
>> +	 * keep firing while the controller can't be resumed.
>> +	 */
>> +	dwc3_qcom_disable_interrupts(qcom);
>>   
>>   	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>>   	if (ret < 0)
>> -- 
>> 2.34.1
>>
>>
> 

