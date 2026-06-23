Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7EE3603EF
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 10:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209802; cv=none; b=UAJyoxd2px5clD6U+FpajrgZK9Mbtfmwf7DknraLFAgryCRYyo7cUiS3ox4JLKdAq8klYWxEdDycROZ5KVY/Bp6s9iwZRMR2u//r/WPpU94MZfSKj6FQEQ8iez6Y1IujEz59z57f1zJcnE564tklb0RttP2AysUhzh/afq+Xfkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209802; c=relaxed/simple;
	bh=YfkPpJdkXtBaCEdQjIlmALxfYu1fB7qBe/0FwrNjx0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Eyisx9+VfbEC0GKf0Vr/dIlJB8J3opaze2TlqkCRvf/3IgOgGqR2eU3wz5jOh9pfWS6BcMXPfuZvHJnVawNGvlX2JA4djMlOwc9rnDqd1bbOvQztVeHPKVn326m98JJQWyWKNQmcMmQoEArvtCLqs8+q0jfUiM1Yrz7HUvSDo/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BsETbVzJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hapd5/G9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BsETbVzJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hapd5/G9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8k82f3354701
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 10:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqFO2jtpsh6YeyYzgjlFbm8KV7gItqZG0Xm+6T/v/8Y=; b=BsETbVzJx04LEHt8
	xxQCkONflN3uYOXbeXuKG0nDH46bulJe0rBTF2evoQ4cJH6OYggJBmkzzNuij3x5
	ynWn4E0i51Aj5n1hFhMPTiQdrMWJdzPHmcvPNMKDO5ylcjSXFRfpTgl8D1EtO6SF
	SF9T173jXrK1xI6Wv4IeTVyKPyNqE3C+iCtFDUZbG4YPOragWTTbaHjImZrrA0y+
	hyUyc6fSvaqZazjW/Ka2HrPUkwG3wClIlar9CKO7J3NOWqT07aMmsi4MToZU+uZY
	jsOELzYN3ZnKUdTQHOE464+54tklSINHkekFvN2IZlj3K5DyonYsB4g1mqT1Ee9w
	0Rzyew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eypx38enp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 10:16:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915ccc2d4d2so105271385a.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 03:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209798; x=1782814598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HqFO2jtpsh6YeyYzgjlFbm8KV7gItqZG0Xm+6T/v/8Y=;
        b=Hapd5/G9p6aZWe98864jKwV4HsT284mxKPxoGeXlvdblPPZU6PW/+J7efuwYnorKnL
         HTKUljxY9xFCQzwIN9M9QUNc4jmL0OlqlANdg5miZkVTrUsV+/pXOGpj2njlvXXrV0y5
         daIG2S/ruBn2uCnWScg5BtjM0WfGPKZ1U7z8oElC8na0V57ggP0t1Mx760WPj/XKG8a3
         TBKBcJNWMu41ExwZ7M5d6tx54n6nQq1lhDwkQmJUYwrCTH6JQE94Qj/swPL+kDo8KKSe
         vjQrRic/QsTNpID7dqtQzX8HuGPh4sHcY2kBVZuybKScZuGv1HCQsEy+alkxiOpOKawM
         zChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209798; x=1782814598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqFO2jtpsh6YeyYzgjlFbm8KV7gItqZG0Xm+6T/v/8Y=;
        b=jKjHbuaPGwNqbswCWdIXwNKn5YHCfaplJu322IMNwrzq3Y+pBkRkTlhNwKT0qdmrYz
         NdKtwyYYHnw0conAgZN398aWvG89gyPRQjRVYPRbE+1e12wUA/hloR9m2sBGSEei+Yyi
         zBvwMZI6JvUHASqB6jkQba7mmbZpJF9jbCu6dkwD6g4uUMPy8qXKm+Qj1hmNhGavaokJ
         vkPmwfbgHSyQGmnwl82ngAXfK8B0y5rYD66i65zoJZ8/U8OHkaDRHHCKvUUq2FevGVYz
         B6JmEhGBANrvJuet4B45HXo1bejsuJXxvCLHLcR8kaYEx1gIL+7uknmDdLBd2Knuy8+1
         lz9A==
X-Forwarded-Encrypted: i=1; AFNElJ/hbUKbOyh7QJnCDeq0Fy8XTGErbcFmk6LSBZNnYng+ZULxl/69RMoh7zqcOCQExX713f4gUZv8KpI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzytqc+UQfxrkba53RJU4UWtheAcVsjlMgMZZXoYgMUiYY5FjTE
	1Y9SrPhv0QDECOEbuY3URjfsU3zL0k8sIvIsmdVra53tgIq+5WMRDRf5V5NquHVfk4Jqf1O2n74
	ljg3ZHw2XVXri94NE/xKx1ux1OGcEaF0uno3jxvhJA3dBR7xHwQIfglmBPXRd6b0=
X-Gm-Gg: AfdE7ckGlJqbJ+AN451MeLXr33tGPqoQfOlCaYPW8fQByIRizHK6eastNjuM8mX2zvh
	lE+jSVn0WGBDDNPeVdKPzrnNyM6X3IiRYMaHit9MbrvLlGJthq+PiY3G5sRU0N77jRE97Qnj8YC
	b316/aMXNOeH2Ef4RgSSYXWNoWzId86YW4sY2/0F5hWLo7KC/ctScZu0NcKyBvNZut/JaWNPdR0
	XTNQJcBPdKrwLjMrCRW7/Jhhn4l3u26HDm53UFQqzKtoVX3C0RtLvA+nnuvtY/BgWtbWW34oy+N
	rV3ulJjXiTEGYzMOW67bCCQ4ODgdNg0wx17ZiE+csrG9tL8GnTnsBeU5J/QvdUrUaHf4MQARQjm
	mCmSYoRUKJI1AgOkQ9fqstb8rNWQNAWR3Ojg=
X-Received: by 2002:a05:620a:628f:b0:911:295d:59a1 with SMTP id af79cd13be357-925ca2880ebmr420613885a.8.1782209797949;
        Tue, 23 Jun 2026 03:16:37 -0700 (PDT)
X-Received: by 2002:a05:620a:628f:b0:911:295d:59a1 with SMTP id af79cd13be357-925ca2880ebmr420611585a.8.1782209797551;
        Tue, 23 Jun 2026 03:16:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e498cedsm486010966b.4.2026.06.23.03.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:16:36 -0700 (PDT)
Message-ID: <77b8d5ce-0e05-41af-8f04-ea38675bc471@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:16:34 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: make dwc3_qcom_glue_ops static
To: Ben Dooks <ben.dooks@codethink.co.uk>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623100000.718126-1-ben.dooks@codethink.co.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623100000.718126-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EsfiaycA c=1 sm=1 tr=0 ts=6a3a5d06 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=1EsaE_6oAAAA:8 a=EUspDBNiAAAA:8 a=wVS3_rNZUYXMhOvZQHMA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22 a=3ZumFrijQQ-2J9H5h8ct:22
X-Proofpoint-ORIG-GUID: fWWpc8AoxqChuJAGUuNkmGOPLoydFklj
X-Proofpoint-GUID: fWWpc8AoxqChuJAGUuNkmGOPLoydFklj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX4vZX8p0a/aMX
 flWnjow4Hu+44BxbouAYg4IDwvTXz6SZIlC25tdkwilY9aeEalFXGR6feT/TtOX7sRxXvuAP/6N
 vuqYwp41FQAu2OAKDzIOsIBUq6A+q0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfXw1WVsuX7dDo/
 zLjmWCXkhNzo31S9BjwgSqGRYCXLYFfOZPWai8arpk3aIWuRCpFzPKKUm4LuQH+5iQ8/nS7h6Rd
 OAuKgyn4MU7PF+E8rLboOpNmxFbgS9kPrjQrbJKlp0WZgMl+8xn6xYYmdoWEq/l4YpoHSlMrNBc
 Df9lPXCdr/JrPPr1rZBIvXja3hERlyvwS2B+YqhM7/TbZVpEwuoo49OWQQy6nV708tGPZnYdtXI
 ST5L2Q5Ip1pefixtrQcmILK7vQ04SZbWvfHRDIiIzTIwX4TVliS4X0BPi4NPEfjCY9a5scifsUk
 1Y1NGpFZZ+/MCerCynkr7LwvbtyHMpgIEhpb+2tevnpRcylhxznb9bC2qaZfJfe3DR9vibTeA4D
 E+Kw2ze0XnfIIGRaOV4Yfgz3J2yxXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230083

On 6/23/26 12:00 PM, Ben Dooks wrote:
> The dwc3_qcom_glue_ops is not used outside of the file it is declared in
> , so make it static to avoid the following warning:

Odd to begin a line with a comma> 
> drivers/usb/dwc3/dwc3-qcom.c:605:22: warning: symbol 'dwc3_qcom_glue_ops' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

for the change:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
