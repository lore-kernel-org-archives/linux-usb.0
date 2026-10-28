Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214615;
	b=GBFCSYjEZpjiYrmfkL0kL9Ed8QgGoFJC9sgArsGB2kkd2IfyEVTgmsEuRFPtlMWBdfsJ
	 e1OiHezWg8CJB2NBW53J+vHX3QCnHU/5m8gfNnA7Tft/5IoHzGAFUu3P7+SLNpc8eFiUT
	 Bx43rYujYGQfkeBcFJ25dKwYPFpXiH26X8hSTWlYMtHVPePWcAvsQK03TD0Z73yJLEvPp
	 7Y3hYKX/lNagxjcPIbGmzyOBz6jaUvef+KwMJk4Opl8tLdVfFpMeFtQX7Fwr4cLeu0fSc
	 Z+ZMZXtOh2wOyR4KVCef1lvr5OWNQOz0DR05QD9sHS/+gspAEBRMb7pVivEW8xLlSeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214615;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iBmi+kAP/eheALBJyOVEtHklZ+4XvVoLv5bzBw0n9d4=;
	b=cITfL74/uHfBqZVGS071zRLwam84qvLn5mVtoSwOKdk2IZIdXtnijVsXT69qRfr5zhEe
	 l9SM104qBLhR0WYzV0Cjf2iaAwIiD14UsJHw2C7tIF00IoeFWDzzFpUQMs1qH0Zejupn4
	 rBAp1O4EFZ88yAbg6WJYx2zWWc91e96DBqH2kBasw9XM/QqB7i0AWyVBi/hs5v2XaS8Ui
	 kVVQfA4Og2UjhOXHqsqiUIiwJwOen2vJ0xrTO1eanjn3bKiHKcToZMHHNM3nj4kkKkkFf
	 5VSzqCqg//zO/+0J23LfgV9PBEQySb9rF+dkY2woWVjCCsjokjYESenTwQhVMDxrPFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1H07VQW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFbAzvNK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B754606AB16
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 19:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B754606AB16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1H07VQW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFbAzvNK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIie8H3043956
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 19:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBmi+kAP/eheALBJyOVEtHklZ+4XvVoLv5bzBw0n9d4=; b=a1H07VQW6GpNeM+I
	Yd8/2FRz01mHhItum6JAE8ukCSWzwpcXlYjvJtOjFWOxmui3p/g+IiRWvI4NYiWu
	/kZ0Qx7R026mn2f2Xun/v67LHo0lHkaEMHtdgMT4KhYGM01CDZKczhVgXWHnxhFZ
	fLReHbQOsDJxG5YbYGA1MgqFYVHeZvi6kI5rnV71eWHPlpJb7PhbvdteXx5HFCVR
	mMwYEOgZ0pLSLEBh+ZhhQiS9wk3PK01IvE1Qz8suyL6K+dbw6HZBdgUmKm8sLlAP
	8KBbPUAfzdQeUXhBBZyguwyi8BGgSMFuqbX6gi4EobVZN5XHQMFBbG/BNUmLh2VY
	ZnzRMA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneure88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 19:10:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-193b5eb133eso1564109c88.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 12:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793214613; x=1793819413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBmi+kAP/eheALBJyOVEtHklZ+4XvVoLv5bzBw0n9d4=;
        b=FFbAzvNKaFA6mM81hYDPhV5PZom/2WOphdDQ/K2zZmmg7M3Qb3ixBgbn8+94mnSeNJ
         QdMg+u7U2jfZcmShoLPh60ACXBQIijce6ni1nRN8Jt8Dp3prxSXUbQY/e4EGxolsUhkm
         BSyjmQEBLiJvKBTGUyGVVNGww4tww+fRL9nGIkTIoT4G7qTYJJXmVVKlxMCs8SA0RLDd
         7SonEx5MnY/MM25G9GCM3CkAMDt9AADZiapfLODstxIMlyPWvxZ2hE6UFNtUe/O5GK/Q
         t5/Ug3gnfN+oUReY/i994gcFvUU3Ps5Ek97LG+SRMDG8q3rk9imnkPSBV91rtxz2T+S3
         BHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214613; x=1793819413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBmi+kAP/eheALBJyOVEtHklZ+4XvVoLv5bzBw0n9d4=;
        b=lJYYcRp86GAuPJaEa+QC80zgI58p69qrMHbWn7IPfPiXU5gIbLwmOiyKbKzoX990/h
         66dmrl7JTbmI+/67zppGaTbLN66pwzdV2646xX0NOLwztAaoje59gzNEt+fd2km7gQ6E
         V/QDNx/X47ZUSD7AEQk1e2qI62+zT+4IW/z//zdaQ9/HUk923glEgDFi8vXA21N/pFud
         6QJfcb9ePaWa/ZAsXQYVZrew2urBdsbVe/Niar7wihWo2irA8h8mQgopfSPYJoRw6kaX
         w1fuHzvuboB+3V/yftTf38Bqi0/HjlzIZHj2OcH2IjmA+OkwIzN5b427vVUytI9HFDdz
         Hh9A==
X-Forwarded-Encrypted: i=1; AKwUvBwpCpevaWfZ3IXkZRfwOHEpgdY/cGALwd1MKqzHUKRE8wyzlz1YafJ4VTUvFricMswcAy3gip3QDAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbNi+od3RdoJboKIBL2nS5v+X72VqIGMVhXxXm17yCYIU8j05U
	OpL34+jKh/QanY6jVAFHdhe3GzYwAm13WzmqRqWSFZ7yLqtLJS79GvfWozE+8hFDrs+sbpR0Uph
	YrjsWtX/Y2py1hvEFABtWe49Ge09ORK8t8wme1Vra5yD4asNwbytgZJJWTB5zffo=
X-Gm-Gg: AYBFou3Y0ZcaEd/GKF0h2R6Jgpo/pm4ILVNs2Cih3i5MxqL5BIpGOCgtV5NJo9w6qbx
	iUkCeHqEnBb+kTVJmdLC/AWSBhFuZ5FnBtnW+mkjK/KDfzRNUzkGnl7naDdqLi+IOPtTle9EW+L
	04/fvr0zZPRvEkBfw2emInaUpoaGcVzuqVC4LnAUfdijLssmA2ZqWrLaysi34fCxE09NrMMdnCR
	46JO3l3bzXYvThuiVpF3SA4EIRGXr1jpAq39hEbgSWVellHYH07U7Hp2sqB+ZKuY1so0d/BnLCu
	yxKNsf4nsiWmLQzge/BJZTY92P2efJLTHvEGytX5xfx3MGOHR17maaH+z7OjTZll4R6+7mtoEgS
	1Za801Bu7XQu3mLQp7EduH60heerD1USrfTkHB+m7LdLRgxdOlUrTbWVtJDao4NXycQ==
X-Received: by 2002:a05:7022:28c:b0:196:c1ca:3489 with SMTP id a92af1059eb24-1a6c2a861e2mr4403330c88.0.1793214613245;
        Wed, 28 Oct 2026 12:10:13 -0700 (PDT)
X-Received: by 2002:a05:7022:28c:b0:196:c1ca:3489 with SMTP id a92af1059eb24-1a6c2a861e2mr4403211c88.0.1793214611893;
        Wed, 28 Oct 2026 12:10:11 -0700 (PDT)
Received: from [10.216.11.72] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a5594efsm10146195c88.2.2026.10.28.12.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 12:10:11 -0700 (PDT)
Message-ID: <485f76be-cd91-413c-afda-2f7ec37f2d29@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 00:40:06 +0530
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
Subject: Re: [PATCH v2] usb: dwc3: gadget: linearize SG requests that exceed
 the TRB cache
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261004031445.1450196-1-faisal.hassan@oss.qualcomm.com>
 <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NiBTYWx0ZWRfXxHO5ktNjw6iF
 xrNE+4kaZ7G5RLF9FJ+johmOsoKfIBSTx0QpN8zVsZ+WmqaAI6V+p+1g1qqykVOKCVnM6pRAJ0T
 DmeK3P1Kf0ZpWstUKnuzLpgbPC4lbvJm/oIk/2aOD0hg/RNXMoJKzwd/IFmgqv9Or4z4rJf3Xcu
 GcAsvcR7tIiDjoae6dRi1MEDsYCb8Z10ctF96A95WiRv9FTKmjg2oXInRTY3u1xG/TZXKEeRzoe
 dxb3ZK6l+elT/c+okw6VvURJHFmmSQhrcv2sddxmQIHUlR8iix8V5KFk5ZegncsJ7Cbx2fbFY1Z
 RCN+Gh8w+o3KXTBg2XJrzi4oSP1XbuVOxRbCPy3HXIsLpjnhpgx+3+kal0bBr5abnOA/R0uVawe
 MwehAq8ht/OQRqJeNj52KXVzmyletSXULXTd9Qww5YPL6vCQ4lCSD0Q0baW8rBv6B7kLKuYroCL
 kezauu1M4nYgcXuG2cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NiBTYWx0ZWRfXxvLBnaPGWz3y
 ZIyE0kKoBCqx5W/i8NOUYV5xSJeF0lRxgKvWmOPGmqGI8Em+aKdEiLnNqlctJ1yKgW8XS43gtFk
 o9keFBBwiXyFPzQUt4SPt2oXlO4TkJA=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae24896 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UBcfgiodwL1-yEKGSwoA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: i-j8eU-106tKSxYG7pNmjjsBFgiJTbk1
X-Proofpoint-ORIG-GUID: i-j8eU-106tKSxYG7pNmjjsBFgiJTbk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280076

Hi all,

A gentle ping on this v2 when you get a chance.

It addresses the sashiko review comments on v1: a linearized request is
now unmapped before its bounce buffer is freed, and an allocation
failure or a short SG list is returned from usb_ep_queue() instead of
leaving the request stuck on pending_list.

Please let me know if you have any comments, or if you'd like me to
change anything.

Thanks,
Faisal

On 06-10-2026 10:52 pm, Faisal Hassan wrote:
> [PATCH v2] usb: dwc3: gadget: linearize SG requests that exceed the
TRB cache
