Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424525;
	b=Y2jKtPsZuziKEY2n0XDMLC1+18+WR57ggaUy/LiJ8aRCBkixJJDNXW8LiSzpTSIjBR2O
	 2EwJziErh47jIsh7HYs8XQI8l5m8UEUS+dwFu1uEq1ELhYoSmYCZ3lPsQbo4A0JhbGj2e
	 EgKbr6ddNB71oUC5wPrkJJyQhvQPyJ0YPbnrwGvF5/KQSFyYjyussnM9Tr35tzZ4yErka
	 XilL5C05jbsuuREkuTdiWVtEoHJgD9IgAoaSWuKzk3Mm2zMFrQaaHZnAg3qAX+yLGdigN
	 0/uOWnR+xK87BBSLRFGPJWaWgaHitjDkYmSKtuG8BWLntRwRbs/Z2+aGi38hPBEcfYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EwYZ7zRNtm83qC/69uLzzi7Kh/KxYHy7yWJjXzboOaU=;
	b=zmUrt3I4aiOwreuZ4yRqWPAk+35z2mMNnToF2nFDtucbfnILHKG3OTxuPpAgTskM1UvX
	 q9r/EJkIVl5zUb2cZS4zS62w67lCEZuHh6Ek92uUFYvtWkuOmasSS7z8QY4YZK2OyuDiL
	 4WuC8egqJSanA+B4sHUfodzeCreNNcQqcJdkljfC0In8yRXCmdGE97WssAhqMhIQfIuFb
	 I2Cd23xzPA9e9Kq2ng7Tidbu9Z/XW8TOaCTI/NdjK5P6RnTU6ZFKR5Ba4KFLKhVCmdJju
	 tPBEMFh3yoe0PNkELQ0MC35e63NTAi1SXCv72vH29ayo2uiQG80lnj6DN8GR9wruZbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWgfoC5l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FyK316T8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E081C606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 09:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E081C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWgfoC5l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FyK316T8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6DmFk1664568
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 09:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EwYZ7zRNtm83qC/69uLzzi7Kh/KxYHy7yWJjXzboOaU=; b=MWgfoC5lSh/4ndNX
	TV4zc27Ncqju6gqjCxzGB+eObjVZar16/cqqP5u4PeErJ8dvVK1ZHX8RY+IS1Jzu
	InN+7M1y/f/xG05MbpuknMbok8YjAgBfa52sGJIdysRsOKlfG7bB5ItSmbGAwKX7
	6gG/fZabpKwZeTwQsEyMpxI744QUiXK/zCW26KcVx6h3mVNprCQ+SVBudmUBoFAV
	cr+PcCETXXPKKkp/rXf6tDpx+WMlWjRr0AGLy5PH9aWzm5icdQfRXd1Y4N8jtJtD
	OGjNNRUNdXHFYspXlsMj4N+nA7Um12b/fggX3C3uwfWWh7sPS/fGf+AkTerGt5w3
	X4fSAQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p8kct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 09:02:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0651873abso15471595ad.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 01:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795424523; x=1796029323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwYZ7zRNtm83qC/69uLzzi7Kh/KxYHy7yWJjXzboOaU=;
        b=FyK316T8niyh6gOP4Dl9EnF4boMi6mUx9eSSoiwcTN2O771S4d8kgbUAj6lkKP9fMl
         ATRd/c81q9gm/0MFJQINgSKqWXTgp1aNJ7LZeDrjNwY6gPkfsvEe5b+tXE+iw8S4dRni
         7fEOFkCIPgSjmWf94KIq5HeV4qrNfnfyGqcUjDEv7B6w36zsK57pXyk7laHw7j4czX87
         DCcj+pPey/VbLJ4UN1DVcLsipEmncJDYKtm6D1OcyiAyeDFK/LB80Eu5mhryu/AgiIe+
         6L7ppSVZzrd1eHiIOWNs12g02begytDPu3Y2DkjtFTec30TpEXha89YmuD7LELfBVNwG
         1e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424523; x=1796029323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EwYZ7zRNtm83qC/69uLzzi7Kh/KxYHy7yWJjXzboOaU=;
        b=ND/Buudtp2lDYuE6BYzUiPLPUsRIdda1ZPV8IWVO4VRDkJNPs2V3qZj1Rdhid/1YcS
         hTWWHaIg6xIMrNOuIVcLBwi2HR5zIOB1/0gCD2+GihpBCbD03W5Vb2VfbcWPLA14AfXO
         J7Id7F87EZkiPcmSNNc0CbeTz84Qn/eYOhz+rXquxuw0BWZwlRhfCeEfufI3uME2qDqc
         0t3V4BAl2Majj2TgPrKXFTMCruTEo+wTsJijG4Gq6Fq/lv88mQCuM44FCXiyWOmrZbi8
         AuoXN3Mt4RFAFrFjzosQ2mv+d0UBTda8MqHtj9MOzPLktKHAtmOFeCkMDA+GRq0GiwIs
         OIsw==
X-Forwarded-Encrypted: i=1; AL+hErFKLaZ/4r817j9aQHo3r7cN8nqdT7HR7RM2xbvIpHr7DsY4no823nRUZj0EYWzWk8CXxUCSdV78Qn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TsmGaSZ8gP1xVhqL0EaeHXPTFqhCksMDXUAwjoyL2LuXRNPND
	hffjzjVycI2Kr8or/7Wsgoujmt9rzqhkgzdq0Nc0/pKgofSg+FHxnNpDO7Hzlh1mhTCud7k43VS
	TRjVKZ/cf7Z2r4b+/XKie9QQREjL/6pBTwm5iFtPBajUBigW8evZNmbIYc4w8rO0=
X-Gm-Gg: AZFdTZfVNyqUC1V5d7ABeVQ9DjIQ7hgdOmSuUbqQB1bcSv11Ztetm2zYdzfl24DHIK7
	UTY4tHlVCA8eqOJupWVjOEahzskcLfBD9GDQNDgC8Ul+Vps3t702yFzLmQw+67xXf0ctIxfYLUR
	1faleQ6Q5JmiJbRMzeL2hvY3DxVFV7AwMS8lRcMOKwP1L4+/6lO7EbjX8Izv9D7nTWumqbHKBaS
	p4t8jlCMaMwj+dCloPezw9EhcRQaI5vFOtgQyKpiflmcR9FKmcxfPkbTCMknaqq7zF3j4fpmLEU
	10L2gmS91MWIEBMGn3LqB5hLxhTo+nmpOlIXMc8O012HF6XOscBhJLqzZYPBwwYQRL2lgIaQwDb
	NKwKeu+znlugWAvSDNbCn7fDdqiqFcvOGLNiZiqnH6aGnTAml0PU61Gqb9hw+r6b988TDayZ7Mc
	Co4Q==
X-Received: by 2002:a17:903:b4f:b0:2ed:4b23:c417 with SMTP id d9443c01a7336-2f03f1d85a3mr95386945ad.11.1795424523481;
        Mon, 23 Nov 2026 01:02:03 -0800 (PST)
X-Received: by 2002:a17:903:b4f:b0:2ed:4b23:c417 with SMTP id d9443c01a7336-2f03f1d85a3mr95386675ad.11.1795424523035;
        Mon, 23 Nov 2026 01:02:03 -0800 (PST)
Received: from [10.217.219.74] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0667679d8sm30774935ad.48.2026.11.23.01.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:02:02 -0800 (PST)
Message-ID: <7830e840-d0c8-44b1-b3dc-185560fe9fba@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:31:58 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: cypress,cypd4226: Add
 orientation-gpios property
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
 <20261117-ucsi-ccg-cc-orientation-v2-1-2e3576a11eb7@qti.qualcomm.com>
 <awBeRhkkKwWGYxm1@black.igk.intel.com>
Content-Language: en-US
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
In-Reply-To: <awBeRhkkKwWGYxm1@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G_pNys72fTg7n-6nMpaBRNsv702UhQOJ
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b04010c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NqQFgKtdHuj9WFOUiwsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNSBTYWx0ZWRfX1cj5tm6XGKb4
 OIKBKGXPWWLyHz6i1YQzsRY2GGni4PfBAotYLHUPJtaTPHY0BUkB5c2aDqk338lwIFya/DLRIQr
 Fp5aSEa183SNbi1LxNBQSHMfAAJmopM=
X-Proofpoint-ORIG-GUID: G_pNys72fTg7n-6nMpaBRNsv702UhQOJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNSBTYWx0ZWRfX/Tem0gb+7bZh
 +hblrJbWj6SHnS1fnKCSWL2Mwfg1IoR9VsWWCTxFHixJ7ZLLeX1hmmB47H2Mdxjx7TulPPzHSmv
 K+iZh9qUHRk8tGWFgIfbd2Agp6BY2Jzc9gLdB9Q4gXOlBef5e1tnO0MjlxhjvsDMhwUetDbVV2J
 qVwo0fI1mhPfYIIuJO8u5jZwovvUuNk5RNz+84ExIgji+gj485ZyFWmH5fVA2CZle2/d5hHQqhE
 DjM9ioFycdJlilC/hyR6TdAsED261mneDtZz/0JNJLdhaUJ3rJYxa6ebGL4E5KAv3jMytJ/FlJI
 2hNbjLNuULSLYAfLvgacmdjABFPo4tvhh0LXVuTT+xyeI8PTgNZfeQgG5c+AoolMPJRDe8qsBwj
 Fug3CUs753eZHdoFSJ7pSgfzbgHrRGl6gkLzs/9RwQHo4LhgmnSkIR+qnZUO9FB/juQyGIR7jhh
 PwfrDr/2DI1zj6CRCSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230035


On 20-11-2026 20:20, Heikki Krogerus wrote:
> On Tue, Nov 17, 2026 at 07:39:47PM +0530, Akash Kumar wrote:
>> Add the optional orientation-gpios property, used to sense the CC
>> orientation of each Type-C connector on boards where the CCGx chip
>> has no HPI register exposing CC polarity. Entries are ordered by
>> connector number; an entry may be left as <0> for connectors with no
>> sense line.
>>
>> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
> This one did not apply on top of Greg's latest usb-next. I tried also
> linux-next.
>
> Thanks,
>
> Hi Heikki,
>
> Sorry for the churn - this series isn't self-contained. It builds on
> top of an earlier series that adds cypd6129/cypd6229 support to the
> same binding and driver:
>
> https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/
>
> That series hasn't landed in usb-next yet, which is why this one
> doesn't apply cleanly against Greg's tree or linux-next - the
> orientation-gpios patch edits the cypd6129 example block that series
> adds. For reference, the trailers are:
>
> base-commit: 8e31dedb9ad496ea7dd7064d77d6f7d459c1c90f
> prerequisite-patch-id: 0ffa67d7d9ce66074ffa2e070249ee5b0cbedb2e
> prerequisite-patch-id: 65ba14bc52b50cdf47ecdce1f4b3fe678704955e
>
> Could you apply that series first (`b4 am` on the lore link, or
> `git am` the raw mboxes) and then this one on top? I'll call out the
> dependency explicitly in the cover letter when I send v2.
>
> Thanks,
> Akash
