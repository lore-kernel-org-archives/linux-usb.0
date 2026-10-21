Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569387;
	b=SSMeasCZmG3lmWpWA4nOxq64Lk25dbfZgjBSR9d5SIRB0MeN04mrNEoVPBk/iRMFjWtc
	 oRAef+1Ci9rWxktzw35WsET0vlkqwXPmumF3JHy1HhC58Zi9fTddgJtMAiFSsCvqpUc5l
	 KHoI4xv+tzEzeg8lDUltReqLsyFZiHI1Zpf3m5iVIUXMuth6GN5VVUuZjO9PL4fnkme0I
	 fkF5CHTXf73Xugtin7geQK9PkoMwkBFFsEJRcEZEfSgiZ/gAyNpTlHaeOjGVeRHuShBwz
	 vWvvuvKgxz17SXTA0Wd/qhijes0KicZrLPcugb9p1RunS1T5aWQdNaHaNi/TV+JQc7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569387;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VtRi6NOkXIi+aaB3jGkA45qxJ9Ov5814u3vrzyc8hMY=;
	b=PzbJx4kmcNG43ewa7xWYplCMXReyeWaNBegYOZuHQrWRnyOCMzNxhpe9CaoQZWrTR6jK
	 b+7iP+yTKpSiv4vHZgdEkNxTFSd0I4x1f84Ah+CZ43fszVaX4+vLtAH2/xfs2tD/3z4ha
	 u0sv8XL2WC2t64dHAeWi/zxzGb6AUSZ2i21a9qmut8USY+Nyco/VdP8IXOImqi3sfAkr9
	 lgoagZD07YFONWaFLaqQDMH28BdzWEoCKVCZ7PXdx+I8OvkMfIxhnDUbYrKufLgaY5ang
	 In34yVUCRtdAIcazVk1qs+B4HlwtSN+Cw79Z6ccxAtmfgcvcOQq8Ga3X0yFOV4lvLqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CRh/3UNl";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cw7PQG2K;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC6606A31A
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 07:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDDC6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRh/3UNl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cw7PQG2K
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j6N3793369
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 07:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtRi6NOkXIi+aaB3jGkA45qxJ9Ov5814u3vrzyc8hMY=; b=CRh/3UNlIucC+zki
	MtYd0tPvDejrTamQIYwzAE7rCfb2L+JzDmLk82ApMX2kPsN0hzhAgom0xByAAQL5
	88WIyVZlAi6m0LGr1FxzDzwdcTQlxofPmulB0ZlPmyYOJuNUUlk6ymj2aZx6QbDi
	9WPkc7B6Sj3Rt7yJdWbqg75JjNXa6MEYv2irL7B43Z+nNeLd5G1nIdjZwWByqLsW
	El3rasoS6IMyFjFi4RRhLkqDsgxC3NvShpqT8Qh/T83XLyjyCMuVlJOns/C0sVYX
	Rdf3KQerpIckRa39IHtsr+D+6pUzyFWmo/LINx81+nQOHfVOEcA0fHkdS5FqRjEp
	6uqfhQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabjq7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 07:56:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so12631785a.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 00:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569385; x=1793174185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtRi6NOkXIi+aaB3jGkA45qxJ9Ov5814u3vrzyc8hMY=;
        b=Cw7PQG2KIjPke8dKznkPO7J0GlsLQIkLq85aYVwQwNM5p/Uo8cFRtvuibpKmEGqrTh
         DkXU+Ktn8ZCz50pU/m1611qo6tGJCqYRqv30CxRBW0d73jvvgUVuOIUaqxikCGZRn2Cw
         mDbuBR9PWAgJeqfDKdJ+NLVhk0cQwTRP0AGlAHapaPjqQOXK8tcxs5cAq9ZRm7n2jmzy
         G3edI8JbhXb9T6oTiucKhPbi5f9E8K/iFJsBTcwzv7V6ucDkyWqnZWr8AGnE2OHVTMBP
         8bNM4THI4iE082n5V3BiHEgJZJTyYLE/Vr28EU+Cot7oZBqYlgQ/ptlWJJdB8m4n7Me6
         1z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569385; x=1793174185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtRi6NOkXIi+aaB3jGkA45qxJ9Ov5814u3vrzyc8hMY=;
        b=pb3jylAWoRjxvQNsQfl/sR+h16Lo4Gae30uZLutIqEdWO5/Z78ymrZsp16LyCkvizC
         z2T/63zmdJtmiHbBe1l8aOznSn8kRcq5zUZHe3UM3WfP4RhtHb+QshiW8jPPtO9j746T
         c9+M+nH5bqyX1ACsFTHbfgrq5CpoNWsbv6yg9OHreYeQD7HJgfDyIDZwZ3tO43u4l7Jq
         vjiP5ABhWCMpJvCijNbA90qOvPGWSrwjMVHydb1j4UTOO3omd1Q2aWFuE1YSonmysAAZ
         57DAdLVYyfgHbESVnQymoJTI7GKLpSK9og/Go/lSKpzL5I43DRlaqrZfLsx6lHTJG3z1
         caLg==
X-Forwarded-Encrypted: i=1; AKwUvBzkf4DW/ocWcxcLqOn4BCxoMniiJyMNTwOZZdq+FLG3mdMxYGxDEQJJk6U5ejJ26xm8GXbwd1vw64s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIK4wW0P6gYBJ6nVbC5Yyy4caGQCy7feVKPoEjDctOljBU30azJ
	MVD2K/bq54MY++LK3RY64ssS22M9M+TwEjrTqpYXt1CdaqfKl4mQRW2NwZmw/LVSa9mZs5Jv1KB
	amH+Ap9nHXvQhzs0/qi0ymnZkr+PspJCC35mySqQBF7o7EZumPpBbJiQEDKDUa88=
X-Gm-Gg: AYBFou28OCW8sJztQPdyiK1mWcV1YoArZueX1SwzxYzAJCvnGsBOgRHDohSQoccgX5h
	BmfOBumnsKGjOR/mvP7Vj3fxQAp65XrN/dMTqzCkYYF+NQY2tNYaWPeV809S1lnvocOMTRCoxN/
	Bf4pOVXDnMxZQPMCW6X5LiOUE9btGk2uKvixdQjH9Eu28kwG14DaWbr3Nb8RnjK7faZqqlau8O/
	3rxp8OgttCfX0Ir/ijaTbIjHMFlDYgw2so9iRdeoxdmGC2qHLjQAK8GryOmyT6H6QU6ytZhb4BR
	fxjJQEcH2bsQmYdCzHPWp5/YaW/CpbXefNNXJp8ROnnbBruX6Je+UK0JJxBianK0D5TAGPUQ54w
	cAnC9E2euLVZn0B34+Qm/IQ==
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr317896185a.5.1792569384920;
        Wed, 21 Oct 2026 00:56:24 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr317893885a.5.1792569384549;
        Wed, 21 Oct 2026 00:56:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030dafd6sm564712a12.7.2026.10.21.00.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:56:23 -0700 (PDT)
Message-ID: <fa8e5c37-3663-4576-9dbc-db655038823b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:56:22 +0200
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
Subject: Re: [PATCH] usb: hcd-pci: avoid double disable on surprise removal
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020-topic-hub_pci-v1-1-bccdaef0344f@oss.qualcomm.com>
 <a25e2100-e01f-49b7-b794-da1027dffedf@rowland.harvard.edu>
 <01f4dc0b-8ed8-46ce-9ff3-df811bd4b84f@rowland.harvard.edu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <01f4dc0b-8ed8-46ce-9ff3-df811bd4b84f@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX/mGoy1qaiH2l
 dlgdVvcc8MfmCiNc1uXpBip6D5h666qBe5ool1PgMGrLowJ1Po52zFWDsGfcMs5ocQLzv3irMHT
 CzjbVG2nsVQUWGJt0PHTxO8rL2Tb104=
X-Proofpoint-ORIG-GUID: vxxOmVHo1uHZdCPt3vL-6PAnfoW4os4u
X-Proofpoint-GUID: vxxOmVHo1uHZdCPt3vL-6PAnfoW4os4u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfXxkDXQ8tx1s2B
 fH2n9vmgtJTwo0IQcIvybqt5MF4dueBL+9fCN+COZlfxQH4JjsbkBx8pwScjcXnj1B5eRO2KkNp
 qtQi5X7MNZEsvzV9KCMJt0W6uyi4NwwquSENMsbDUJ+z3nRiUREQEH2iIKtXFgedQsdtPrHwPvM
 cK0YuPq8He7u3FRqkQRD+iCb7BaGlpP76myynLPX1zk0aQzCvd8ZqN2cVngJeYxW8y6TxcApG0W
 xUn5uM9U4KjcGh56O/k1YPpY91lvG/4bglS7g6EcuCePTV6nM0tyDmD0RQ5d39a6temuxt88zgF
 eKtfwraYGYz5Ja0reWzzHPVqoxTRKZBHQCkc913H6wAY6dqI4HX+L/o+Ba3iigGU5jForomPq6/
 veZw62mqyYc8BSUFGFN3LIOU7/1A+beb/Tn+xpc003DiNJUjZuMIId6RR/ol74T99VLJH2XScet
 sBHBwhmFW8Fc5M6i6YQ==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad8702a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=Hy5RNq0q4uYjtSN2GX4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210031

On 10/20/26 9:55 PM, Alan Stern wrote:
> On Tue, Oct 20, 2026 at 03:52:28PM -0400, Alan Stern wrote:
>> On Tue, Oct 20, 2026 at 05:05:39PM +0200, Konrad Dybcio wrote:
>>> A PCI HCD can be surprise-removed after suspend_common() disables it
>>> and before resume_common() re-enables it. Avoid a second call to
>>> pci_disable_device() in the remove path when no enable reference
>>> remains.
>>
>> Does the double disable actually cause any problems?

At the very least, from drivers/pci/pci.c:

void pci_disable_device(struct pci_dev *dev)
{
        dev_WARN_ONCE(&dev->dev, atomic_read(&dev->enable_cnt) <= 0,
                      "disabling already-disabled device");


> Also, is your patch any different from this one from two days ago?
> 
> https://lore.kernel.org/linux-usb/20261018164134.134106-1-cole@unwrap.rs/

No, we can take that one instead.

Konrad
