Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6132DECC2
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956350; cv=none; b=tReG9LNA1hjSlUUnWS6LyRh5kblVa0FdMv8W2FLyZtm7MyzZ5quW50aGL84sX30HXyBXLjOFcDILmBKXFpYOPrV7dMRIWC7LtXp56QGPM/arzUqqCuyn2LMIwl6IaS9zgGNHgHRaQ80fOt/ZqPtQT/3rEHY8jXvfcNl/OiHb7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956350; c=relaxed/simple;
	bh=t3uAI0g66IBQZNEh9gGMneR3Kc0eAOqCo4B0f1YXMSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XSIjaP06ou9oVp5WPKM+vaztx2niaU0S+l1JGqKTrPq5xJ/e5w6EcvVpKGvMyCp+h5ETCtpaHW+aGsiAcmESC1HkMV5/S7xu+xb962MRKKDXaomh7422dpxRzUb2d25ZV9CdDfsYRCjzCn40u7MegTqhCJY9DRC1FdOFOggX8NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmi9blcY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AUCMegNl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmi9blcY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AUCMegNl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HS66c3617890
	for <linux-usb@vger.kernel.org>; Wed, 5 Aug 2026 18:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nWlbg+M3XnhuwAxV/EwrS/qi9DccecvZqg+/FoKZWU8=; b=kmi9blcYllImGWuB
	SoNq9QDK0oWiUj1jIgqV/w2pAc1slIgMJy+f3CTQGMYYbLGXhZ95OIoGDTk5S75j
	73UpnEkQKmeS6uZXxUMig2ohn/0x3QnuDVwL4MaoFnYA7JVc/1q5Rb6ZBiCw8nTT
	879rgwRLyncsEUKF7q5b5WJWr7R3Ph1d4lsER+LSs3B6qtig6XtzwpVwc2dLbjUv
	JarVlfVfQAdcJYlJ7gP7VjCmjkog7sYW8wYZtsE5Z+V8kbkMcF9u4RAOh42Lh2jI
	tXbYxM4R3sd7HQ/BfbTgJjt2MbL2BbES3O8G6+7aaK/ZIGDfpHTl8zpopwFr98vs
	gnR6eQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2r62gaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 18:59:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso1294253a91.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 11:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785956345; x=1786561145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWlbg+M3XnhuwAxV/EwrS/qi9DccecvZqg+/FoKZWU8=;
        b=AUCMegNlYtzz7wzGtniOmqRDr4nhBJ11jPxUZxPU7vKNXvOOBtO5/JZOrukPyzZIZW
         Ix8P4APaEI3tmn4qUBzS3DdYSuerbx3bhkcuEH8VuhIRRcwKLz701ODGr2ZmR3jBLEda
         +mKbXtD4YlAdFeWC/2gX2fbkjozR+BBy6XfVBsOxrswgH6xJc3FWdvzFxAO/0zBRO2+9
         hs3iF1PtpdYkEUx7mvvHXkp/Xx4vwxofuLf4TWGGYQcVckkQ5HRUIdjHAbHkHOd5+b8G
         /7YSNaVhHjT66z1i9OjlydNg6YZrVEmYn7tkiRUj59h64hVPdGZd6+ILC5UvpjURwi15
         O6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956345; x=1786561145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWlbg+M3XnhuwAxV/EwrS/qi9DccecvZqg+/FoKZWU8=;
        b=ZiAk8XQeQv8JWqugF9lzvDC4qVcA9LUthMHbNgIZUGOKzZig+dADL86c9WZXJj+C2+
         ajRGf+HR6xFbnMOBMV3wkm4yPetyiDkUoC5WUMezjtnaeldR3mSSlCZxyi0VadJzTlJi
         XR0oSwDkOrHRdoZFy/XLC+e8xdsX4xFbi25L/JcFGYHYh0ODMm1aNfQ7mBwN/AaT1EFL
         MHtQ9kbSSuEU7ig1mpKfj/D2uSGjqzeAec2213KiFj1V/HUm1KA6/huVtEgwAc+xgDjQ
         YDE4/Frme5aq48Y9923Pm+2dc9sI0ei3C9asLN3O7ZTkMuv71u/a93RCqHwrtSyY3AwL
         32Sg==
X-Forwarded-Encrypted: i=1; AHgh+RryKTOjINCHUzxKU/LkIV3QdRgSNeTpCKhuZ/OIA2EdnuO9gTgv0aG+aWjEW44Npuv90bw4vqAOquc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2n+WAp4zk0r/jxr6qhT0gse8D9eDetcLhSqYwC6cf6XIZS/xE
	6dOAr+ENbiiFXE5opGTJQQJEFxQV6k00+bOg+eebApNqhPq0Dvg/XRy2z51onNkyQO4nCH8z9Lp
	/5R568SBusU8aoeYkOGXF1KY2iGk9Rvg32xdt5KbeF61TOjd57Jwun2yXyYmfODA=
X-Gm-Gg: AR+sD13Vz97NFqV3bhZN08eS+/gDCKhAeDSalhGfNcurz/5QiUnhMrjTtGmm6/yggcV
	gUMq3M9vayO8J+XxbV9906d/A22hP7oDc+wmCzFODfc9DozpTZgaBTCpLHsJ8GEzaV1LnjB0Jv/
	JPBAFMYoxkPSN30aXRV2KdBjVN8hZQuBsAKqi+LwV9Fx9egunkuRojgNnBHQVos8SxozjoJtlEe
	Y7bfmNl8Cd5Ag8wV4iYj4vAZ60GPh6bAttC2jGN5rlFSgu/mGRpowd0tMYD10x5Axw6c3fTz2oc
	N0HhTBkxJGoOISHfRC4HsFuWQxAQnPdRj1sf2F7LaFt6scFYUEvJG4OUIoYLUVsbjRs46nAtcMu
	DqbbTJBqMLHxH+H+URqPpKuMJO5Xy0w==
X-Received: by 2002:a17:90b:3f47:b0:381:5a08:6291 with SMTP id 98e67ed59e1d1-3903c68fcdemr9133778a91.20.1785956345353;
        Wed, 05 Aug 2026 11:59:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3f47:b0:381:5a08:6291 with SMTP id 98e67ed59e1d1-3903c68fcdemr9133720a91.20.1785956344838;
        Wed, 05 Aug 2026 11:59:04 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca6576b7sm14887218c88.7.2026.08.05.11.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 11:59:04 -0700 (PDT)
Message-ID: <b7c0326d-0e36-46b9-adb8-5ae328d82c08@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 11:59:02 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 30 (usb/dwc3/)
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <amtnlbQl2KLongvo@sirena.org.uk>
 <a9dd53b3-0666-404a-99e0-76617ae3f944@infradead.org> <anKJB0fmgBNEPdtK@vbox>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <anKJB0fmgBNEPdtK@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WrIb99fv c=1 sm=1 tr=0 ts=6a7387fa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x__JeEkXMsYg1Jg110kA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: p72c2dKP5ZHFTCLaaVFZ1HUT7MbVD3dD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE1NiBTYWx0ZWRfX61dBr0ru13Rl
 qR8PEH2uOpKZjjOTtpmTlaaEU7cND5cNT2nRhYftnBK9YO1z/zHFc++Tyo/ySXrt6y9qo2m08ma
 iWqM4HPYw9i80PVmbKJh8NzRk8xzLew=
X-Proofpoint-ORIG-GUID: p72c2dKP5ZHFTCLaaVFZ1HUT7MbVD3dD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE1NiBTYWx0ZWRfX2+qpS8Q57YhM
 mN0KhJB8CEaUNs6v0adOky5BA4ro1+2wX3Ph3vYKLRnIwwfK0tMAWdKYnUDDRJFFyjg+1ElG4wG
 vfjnpegoDeUcytJvqppuMnx1Tv++G8wJQt2HkCCBPBj8Hec8Pnp1rq5GO+UpjSumk5ZW//YhA/r
 8biJvRu4HhyruTu1c4HJZpttmP83jAFQxHF5D5wyJ/STHMCXmrtWsGWUVoMcMqBF6TVoxGKIvoi
 mChnA2685i4P5O2aJKjow7sKk9blxKtPV4Ob/gofkiKk+e0XDqcdcOTV/3QL6esrbxM+ob/1RFM
 ISISmt9fBxpDvoD4M8cRpTjOmhfN8HAxSufuZbCOGVwOcr3tX/nhhkU6tvXy84Urqul1R+EjZId
 npO4buXZAUyxvqWxb7+wQrrEu0rHus5qM0HZkwdjJ46H/yLF1l5XQfE7Z/nqvawgjGRyC+/nIJj
 E6Ipv+gl1J3mrAMDeuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050156



On 8/4/2026 5:57 PM, Thinh Nguyen wrote:
> On Thu, Jul 30, 2026, Randy Dunlap wrote:
>>
>>
>> On 7/30/26 8:02 AM, Mark Brown wrote:
>>> Hi all,
>>>
>>> Changes since 20260729:
>>>
>>
>> on x86_64:
>> when # CONFIG_POWER_SUPPLY is not set
>>
>> ERROR: modpost: "power_supply_unreg_notifier" [drivers/usb/dwc3/dwc3.ko] undefined!
>> ERROR: modpost: "power_supply_reg_notifier" [drivers/usb/dwc3/dwc3.ko] undefined!
>>
>>
> 
> Thank you for the report.
> 
> Hi Elson,
> 
> Can you help review if this is related to your recent update:
> 7c87ef27af79 ("usb: dwc3: avoid probe deferral when USB power supply is not available")
> 
Hi Thinh,

Yes, this is a side effect of the above update.
I have posted the following patch to address it:

https://lore.kernel.org/all/20260805185401.3625514-1-elson.serrao@oss.qualcomm.com/

Thanks
Elson
