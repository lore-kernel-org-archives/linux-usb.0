Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0604443F4C2
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 08:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546132; cv=none; b=QS9pYRiVffqwZbcgdZyzBTQLLj6chSZnz5JC04CFWwoIPrBdLzeP3YGmyoLil/FNFRQ9cpdnP3IG9r+fKG2eexTEUpbZfNKBZz0ZKzS9ucSStlJIEvTHCR8fwVianAt7sAVO3v1suKSipLjnKyXTwYp+ZxyfGk5eQaYuYf30nfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546132; c=relaxed/simple;
	bh=943gMq0BMbPHr5dCslSjYZdPHtFlsW43S3/CnAMZUEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubOZAakqPaZoeNdLDMz2XiCLHqtJCOhkv5RchcnZYfCJrjcAI0zBj+dGdais05AUB+z9EkPbfUAme2CQ/5PkSrSvrRJkcuE+dVVWyL5EqVLJw33/FAGZODjJ5zop+syx9jkZrMdX4TbfYp1h0bRd1xSJEVGPx4jFnsXgpt+CSRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMVdzHsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqnaV9BH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMVdzHsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqnaV9BH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G69eKp1163471
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 08:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6x054kozMABn2+nc5vjBNZSxsZQg2BTB9VQffNNrUXs=; b=BMVdzHsLpfDMo6Qe
	bf1RZ6nGVGdwHW38RL6EgtCMwVb2g0jMAp5We10lqOY1yL2hQMPX2McWf3SBApOs
	LalF4Zto4qwnd7QFVCVSrMqWI2Mb/i4Wr9p8eA6mmRp5McEqhb5ITMgUxEHL6IrN
	s0u6HF4Dt1adetsCTwiPpL5xkvWp4Nho9aY4Fn7Q+xttCScnL5J7zRjzrNwbNun1
	AxO0tt1UF//abEYDm7B3wQ0nQFXOB5jlsLBXOSOHJ0OtkVs+U2Kp5nsAC6mJf0It
	JLzF+ILtwszDyxRN0bE2D/BRXkzQDJ6QDZ4M7BXTOXlsYqusO9ZPYHcHzpK0Tnhb
	vMbYWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n63jr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 08:08:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530a0a18108so14197591cf.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 01:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789546115; x=1790150915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6x054kozMABn2+nc5vjBNZSxsZQg2BTB9VQffNNrUXs=;
        b=cqnaV9BH1nYenIzfB8lP0pwRcVoeXcdSWIx4Z5OUYAOU6XGHRVtLXWtE80gB9lRlp/
         kXCDXmaX9j2t2ifcaGrrWShDtEwXQ/LKTV2T5w8HDeJsMMYcHvCqGV/4a2Wmxpecsd/G
         q/wc93Ycwn9HbVqxgszS58w+qq/0EY9x7P4Rf6i8/zt/ZPI++J0U3RSXIZW9IF6lzI4h
         COUrRKCBelqUDoHL1rkj1aqEFDoZLvsboiiYFADLhQAJtoC9BjLEKAlsy5lXK+L4P258
         zRQDjNORxjTzyFF9xEKaa3WSbOCjlHAmFWbA0H+v1+F6BXn2He6MktSo6xLPNK+F+Y+T
         FSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546115; x=1790150915;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6x054kozMABn2+nc5vjBNZSxsZQg2BTB9VQffNNrUXs=;
        b=D9YAixZ5s0hxwKOE1ZesbS8TQa3HJJ7hob/E/NFthu/5ksIHXdfkKXr9iRuQg9b6ps
         57dtXTX5kRqwVsV8lqp855/cWh7yqQ7+TzVIEHz2ecjJitUx/LeqNt31nHLuPHRJwtMu
         pV5DzyGGWuWjx4s3lOHoqEHF+UqyujOqSlDVk5T+dAdmeVt27MTJOSnd4pPPiMyC0C1A
         FvWHjc5blX+8RechM/Xpr8GZeXsD/U6LxjJsm8cKxChkbfRc4H0KsHRe2fB+02FTCABf
         /wWGYKm3keG1cvDK2/UzuZCl3J/6B08wQJYmbtyruoJe0mSb1aqMk2s34TD4wWxkQRNS
         ELUw==
X-Forwarded-Encrypted: i=1; AKwUvBzi6s6W5RARb6ef7EpoxfTX9ZmE2MwmbaeNbl2vkPnOx8ynbuG/Jf+Wq5q9hUT/55uIcy9iNr9NTKg=@vger.kernel.org
X-Gm-Message-State: AFuF++kIFa71v1/gv2+nYReWh8jO8utbgZtn1FWgCmN7iHS/gjC21dIq
	KD/CDDYXw/TBZUafnbY/LrjjiUyAT6n6X+rA2YOGRW4xDysRTGvS173MijhqD45bH9prfvAx8VM
	aSYMzYZ7s3VjkpOeKXwEckZPk9jXkzh+FET9Nw6QOh6eKcoBmcWNm32ZnagohbjU=
X-Gm-Gg: AYBFou3NTxt3Fdc/PREvJOYbDS5dWYIBQR/q0A9qnyNQWqcnVZYzgC2gsBlZJukoJxP
	tEF5Vr/nB3hWX+yfgh0CkIXYR+g6RzPaVT2nE4BSpo1oC465n52VrXjr52x6jyyRR7Gc5EqAyp4
	7iwubCDH8BPcNH5ulzD2OtOFdnl5Z/07GSJUBXR9HNwFE/+UO1WX+DUrJRgUxuokXBw9iWRRVue
	1Wl7rQEE3fu0Iw9vu7JYTugtkjqsxqU0hl7PRheXAyMF5iF3oEiGLfOhpc1f1O1mtxpga4UKWUr
	2jQNTKzYmDVmymxaC8s09HqS2G2hVWxSzB3MXwbVlhusXJ4+k3ZzY5FexSoF2lnaip0U2jb189i
	sG4qD9f7QZbQBNVOir1dP+w==
X-Received: by 2002:a05:620a:d85:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93bb7a47203mr204549985a.6.1789546115268;
        Wed, 16 Sep 2026 01:08:35 -0700 (PDT)
X-Received: by 2002:a05:620a:d85:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93bb7a47203mr204545885a.6.1789546114854;
        Wed, 16 Sep 2026 01:08:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de68fac9sm78377966b.57.2026.09.16.01.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 01:08:34 -0700 (PDT)
Message-ID: <9b22f66f-a988-4ba7-a561-b40e38580512@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 10:08:32 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Make PCIe NHI support opt-in
To: Greg KH <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
References: <20260915-topic-tbt_pcie_optional-v1-1-47c4a3d129bd@oss.qualcomm.com>
 <2026091611-backward-monogram-82e7@gregkh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2026091611-backward-monogram-82e7@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa4e84 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hZJKpjM1h6w7ISo7GGAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEwNCBTYWx0ZWRfX34VohOMmuSw5
 +tmPsProcKqkAt3M8+YGtNMa98duY9TH+GThgiEJIpC0Uj4mF51ZXF8r503sEjrIPtgodtUmyzu
 5Fa1LpnSYiBfsJ/4xcDBB5BHhhZZH+N+h+iAYjU01Radhrs9jkbOOMyjiy5TGSMxcA1htb1DthN
 R4AJp8KSetJdDg9AVqVnYPDOF3W6eLC28vdfTdg4LMxjgrcyMkLT7LDzW6+n3dS4yXPD3X8Jef8
 twklhwXSmSaiW3pSZC3l39o1COQzl5EeNvXG2wpDm879i2TnvV5pKAg4UHy5q3OxGi8hisqbT7r
 T9rTsyMubJ/MUyZkak8owVFxmp1uCEE0iCtp4ftrh9K8xMwSxUAnH6JCWwVcByNz6XjufxXBodH
 4f5PZQOef8FBUEFg4dWtWAIVJcHsQ+/Laeks6EnqJD2aEtBJJhXSFA+qnGODqQvgDC1zOv1dKEt
 SQOjJzRUuUUXfkc8uJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEwNCBTYWx0ZWRfXyg2IePRJKssj
 NKH8zeOPq83+EJ2LzHb1dPwv8sr5EI/vUhzoNnvjA27nIO3MrGlC6z7YvjWZhQHaoW2zXCOnf6J
 O49Y0zbEVid3RUV9C+8N1S0rpoX+eLU=
X-Proofpoint-GUID: f6r_XNKSKtW1gsmjhGq1N22qnA7cSwFX
X-Proofpoint-ORIG-GUID: f6r_XNKSKtW1gsmjhGq1N22qnA7cSwFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160104

On 9/16/26 9:11 AM, Greg KH wrote:
> On Tue, Sep 15, 2026 at 07:04:10PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> With more implementations coming in, one may desire not to enable
>> support for the PCIe-attached NHIs. Allow it to be built as a module
>> atop the framework.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Why would you not want this?  Can hardware not provide this for some
> platforms?  I thought it was part of the spec...

This is about the host interface/controller being attached over
something else than PCIe, not opting out of building support
PCIe-over-USB4 tunneling (I believe that's what you interpreted
it as)

On (at least) Qualcomm and Apple Silicon, the on-SoC controller
is an MMIO device, the ASi driver is in review and the Qualcomm
one is soon to be.

Konrad
