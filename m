Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960534;
	b=uKYLyJPt8jmqWZme/73Bz2Zhc0rVsVRfagAria8tKcCCR/4oBEH6AD+NqLrGJHjWxDPI
	 5k6iH5xrJXmIbersmAXYrS/DVERGq5pP3vCdtCwGcwHutLtMkMsaUoQwNdU/dW/MC00Ma
	 pwuZBkh7hzM0hjnn/zVkvGaN0yk9Yo4GJEzFMoMf5QMMzdeeHn/5iRZX830NEkwVl+A41
	 KFPnflyuF1HLtKOgHLh6cKPtDfvoMIM9x20J3PEQbiWCVbpFMIvfnyhonmPP0h71V4Iay
	 ZjuPwWUKujoOQYSFyUAL2z8UizNM16zR6i0KLluRRJ3PKmJpIbmWQasr+cZHlHNkqOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=;
	b=TPJc1Nqph8KCKPTB9wwjQU9FOdDUV/obpagh8vDqWLIwJE61tT3tPr1/XVmlReXvFD2T
	 ciyxvciyZfAOd6TgIQmFywxg03RKoUxgFPYCUqL507KA+5W9IUY15gd3FcrRWbLxjYHdn
	 iud+BXO+IJhOLeevVpTOWRNq+W/uE0dkd6EU1p6JfceqY02WDdIhAeSLfYqnTjN5q9i7o
	 7cUj574jkRf9tq3UUqNAw6xrc6aq9X9nPKeJVk9r+0wmPWWIlovHQvdVac8BCpo/rmuPy
	 qA63wy/llSSDGkW4yiHvd+eez3p4spoDLMFeMrsZDzLYRkQbmTQrqDiQRinCAvOA/hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4Q5O9bK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gsNbiDwW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E28E606A331
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 00:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E28E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4Q5O9bK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gsNbiDwW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMesTh2627369
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 00:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=; b=A4Q5O9bKjDBiw6Yi
	ddl0tRxJT8Au6jdyHYTBtKwFCMqX85wHHAh1311Z/Vx9TGJ41gEJS8fvjPdMTTW8
	/+xIIRv/JWt3+wxPxfT+Rtg/T/wK25Q4pVDRMK8/LdHE6jqIMxJY0eIErib7DKwt
	PNPJbjzcWGf6U7M/DAEwA7pMlUse3e/O9h6NvV1lBJwyFsYeblw7map8t8xC4Zpy
	KtswgHyEXTKkYWs1km48IuQ6mx5wfumcaEmBSliVJMZPUyk6VYC1RmFbw+N74Yc+
	s6Kb5q4H/0C336WVhTuShkR+dklD7F1Ba8jzgxZeI54CPpok2Y1lYvJn1YVZQDl3
	C2LC3g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9g97n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 00:08:52 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so1219013c88.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 16:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794960531; x=1795565331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=;
        b=gsNbiDwW4SiyaA2zBIeeEmowwRKzz51IUMaJuGH1HqW5G+sUxCuscod5cwDDutsouV
         Jbs2RaeEx5kO9iM5c9jGJKo19avkZ8wD5tS27d9YRfZSWXEt+Ish7bCvr2wWDghWdB9+
         SO7LgSPkbszYIsLJGi+J0ATSsJeImNDt/g6sMGXd6Ro3CHcy7wDHp2nxsUhxm9ftAuJ0
         MvPooiE7mGzf38n2dp72q4HOvzaAde8cZj+h6BfOXLIkkR+0m0klH7yRs0WUaRDvLArr
         J3InNhleyJcGSQKkwExGms6TIBuu7W2Z46+eH7ZTfG5gLIgxb7G/nXn8T3PScWDjsMxX
         ZEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960531; x=1795565331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=;
        b=0ekXxRtfOldt9U7uCoXShr/j4hInR/JTyMREv7xlm7HxUuDjp8NdNNCnMVWbXqhQ3B
         EYx4ZaguTbU0rQjdteHSyROi7fjT9poCH7DJnVQPm13rS5c21p9iON3I5gGsGWCAQ40X
         sYhNk12h8cNOMcd/i8mzjv8gQAGrpfG0/Z5397mJlK6ILoLPOOYcii5qbVbftCx0e62/
         pbY5jkRFVvWUHBr+k6vw6nGpNqKc2i/yLddC1ONh0wV63dOfe+x8qShn1DuhckyiDzYy
         GsBaXZy5ko3SRA3vLtT19scfheBK7++Pvy48k6oEOTv+5bltWWDzHgX86sWh0j/Fstcr
         Q4/A==
X-Forwarded-Encrypted: i=1; AL+hErF1Od17zbUMPdS/0SsPYdwSWhu1skkZD558f+hbxes4idxLRjeSkqvb4FZ/qR0eedChrRu0Z+jisZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jmZQZ2YnzCG9IFOlqvJmDu0ooLKCxbd81BcwYFx0MJmOVphK6
	W8LTOqbMTTxvmKS1SiBvGO8so3Wk5TJZSlhWpFFziDs2ZigSNZsSetEQ5X7jsNfLrJONHTpYWLH
	ObptDJK5LbhDTeI1KneZHow+urvnAhoRbPvxzirGVjHzUqgVEI/LKedaCR8MiET0=
X-Gm-Gg: AYBFou2Bz1uI04ZquP7wUHrc3tKAxRNiNGBZsTHHDbgrnsBcXEbI6c3UNeLOAe0DsCX
	BsbrRZHbw8tz1JOThDUvAAZSbAohhez96s26VQ+XsymsJ+UmAXPJ/2kpZp27yhkCi/oo2Reo+t5
	7LvtsUxRR/URUV68vbNT4vtyL0OfaYnr9+I7L26IW9ZzyyJtnJE2de3qwJJQi2rIoVpJGIztS9Q
	tAFOBsQAtvMKLPxdKMD5P1DaLhfe0Ktpai35WHEH0HvjClZEGFTBeIFFWoX34y4hlF9E4m/WVbP
	gjZjWS06fU1zfWscus+9D0o8cxYbPYPO1JLjZUsWgP8dY/zs/xZTAblJEACIrWQk0NMFeCOQbvx
	93SGbdXcRAadmhHJ5JaVAknUs5oA7KrpLOzwKu21RRvPccy5Xp1p1gAyvKKGf2bKqPyWT8Vr8K4
	5GZchpMKhEU7HFoBoutlu74x4OtiYffQ==
X-Received: by 2002:a05:7022:7e83:b0:1b5:23c0:4f15 with SMTP id a92af1059eb24-1b543c3fd9amr1137374c88.39.1794960531506;
        Tue, 17 Nov 2026 16:08:51 -0800 (PST)
X-Received: by 2002:a05:7022:7e83:b0:1b5:23c0:4f15 with SMTP id a92af1059eb24-1b543c3fd9amr1137340c88.39.1794960530842;
        Tue, 17 Nov 2026 16:08:50 -0800 (PST)
Received: from [10.71.178.189] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm2262069c88.11.2026.11.17.16.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 16:08:50 -0800 (PST)
Message-ID: <39bcdc68-1925-44f0-9958-e1253452c113@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:08:49 -0800
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
Subject: Re: [PATCH v9 0/8] Improve Qualcomm EUD driver and platform support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <57c5aa78-a116-45d4-ab32-772cd970e6f6@oss.qualcomm.com>
 <2026111740-florist-conflict-eb96@gregkh>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <2026111740-florist-conflict-eb96@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2-t7i67OhCf880ziQP4QltsjLAaQJ3la
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwMCBTYWx0ZWRfX1/y+ZeUlzs/r
 mStwIdfMWbAdVPB8PeRciixYROnOuI/wIvURna5mhKFugdxtCKZuQXMwnJjJzPUJfBcWtkttxPh
 FQ9epG0R38MHrgum8cghyGlyTmEIMm8=
X-Proofpoint-ORIG-GUID: 2-t7i67OhCf880ziQP4QltsjLAaQJ3la
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwMCBTYWx0ZWRfXzgTRP8v6EUSN
 de9Xafhk8roNO8uVFf0r06IlkFyEK75vay2RkN1MpdwatAqbjQGyhkmhKnKLiQVmVCrladGpCsy
 NfnO/+XtiXr81Ma7pj3hCTeDML78A9DZQzF/pV5cw+al20zq14xgzyn5S6x2PaTFaf1B9vzbJm4
 EwR24u69L7MkF7kIbaibcXtBD2in0ot3OMGyx38LFcB83bVcZX86bI8jg0b4ZYbT2LiUo3NkR24
 MKweRLX/7DgSaaLztjjJ46aeZVit3k/L3mcEcv0/p2Y5U5VAUZMfnS5ylJCqFWEKiHktSljQrZ7
 Kqhx5TB3HgTq4j9dKDj0aQJKvjK2qy4rZIj0ENlx1M7VhCRQWVFvOAyZ3fYac+2+f7fu7a+yAq9
 sUdCPNYksOlX0ATXoOH1VPYI+MZ+xq4gGBV7mkti1iQGLHIJH+t0sHGhj7dwtrGEEnhNTDmw8h4
 QmoPs8n4/LI38RziEaA==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afcec94 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VfwtAWXQdzgZiewqWO8A:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180000



On 11/16/2026 9:21 PM, Greg Kroah-Hartman wrote:
> On Mon, Nov 16, 2026 at 04:06:52PM -0800, Elson Serrao wrote:
>> Hi Greg,
>>
>> When you get a chance, could you please pick up patches 1-7 for the USB tree if everything looks good on your end? 
> 
> We do not just pick parts of patch series, our tools don't like that :(
> 
> And why top-post?
> 
Sorry about the earlier top-posting.

Understood. I will send a v10 consisting of patches 1-7 only.

Thanks,
Elson


