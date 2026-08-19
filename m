Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5030143B496
	for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 10:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135664; cv=none; b=fMzZIhf9fw7RTlLYKzdbc0RvGl6CBhMf3yDvGSgPMqo2oGOds57990myHJ1XWnpimyJZhZHtzm+gG9lC/5PLi5meIAmk+Ya9apzM+YN+bFYUorZ2V/V8qQh0oEWqV5/CTAOBffu0FLqIkR74zvhQe0P41oApr0SOzzMGSRHmjf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135664; c=relaxed/simple;
	bh=PXWpCjYQtb6zdAWnCS3MdSSv+WWICh4QW5PHtuIey44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvqq5hRg4U7PXbsEcEssE/ieLOLuMAr+RyquVVKGlKaHViPcPnTmADlCS3cBPgwiI0FBMkQrxE9VzAkldBe8M+TQ9u7xXZV3TzihfGRZiLOAMW329kTyVSuELbx7ceTjm4QlUFEOIkS8JFIqK2hST4vxB5s+eSTHzMHJubGH97g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQ3uiwfI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=alSwXv/a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQ3uiwfI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="alSwXv/a"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7nTi2947171
	for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 10:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L13q/JSCJFi8BVIktBNFVx6pTxQv8onyK90nXOfMrpc=; b=iQ3uiwfISB8NEXFN
	BBZ2JTTXNVZle7DHl0JIfykM1VH/3KJSUZxJ00YcFFRxMyxTHRKBIebnxXnrLKtk
	DFeriSAB88ugJFKz8joVuaYTTz5D6RzgbSX2vF0rqq+A/nZz8+MRLi+Cz1kmdSIq
	MnPfy3EFdqtoxlXPMPl7Oy5ZaN9nqyM5J9fM5LBlCTUJMM9ZPzAC5l+tU744spgT
	7f5I5W9JG5CV0S1kCFqWy0QlDHtrhw4JmonKntrS0AuFgF5jVKqd7khEZhZsZala
	vQaiergA6/WafvV1vf4MmMmuXhvMO/U5M98N/ylYR1XKYkuwXia4xKt1AqSmLtZP
	Ng08pw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkaq7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 10:34:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ebb599e528so1655826d6.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 03:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787135661; x=1787740461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L13q/JSCJFi8BVIktBNFVx6pTxQv8onyK90nXOfMrpc=;
        b=alSwXv/aZkZrvlFtJ/Xo7AjPi4ru/aG+TUUD9Lh8wsW9urJJvXNWMt+Z4wFrtIygSZ
         nH0QF3Y3gb1AUdSJtnjs96/rj4RT6EgU+x1kr78iHn1tFw1FxIdaTW+exWYOWzqsMd+T
         O2hfF0Zv6IqfhO1WiGeVTvlSxDw91xfU6npBoPnD14VSwZFLCDylQf/ozKlNFS8c8jDr
         t3qbjUUBUHZAdYFj6Q5XzjXWFV/SkpkQeTWei0qoEZmFdy4o5oOs6rvpVJiCLRg4hET/
         svAhMx9LMp/0TopHcgOWqLG3ja72SP69xEgBPGMYhlxRZ2J73vgMafR/cCOGhlDLRPJj
         thag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787135661; x=1787740461;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L13q/JSCJFi8BVIktBNFVx6pTxQv8onyK90nXOfMrpc=;
        b=cJ3X2uaauu8D4jzPzhX3gmijNwHQ6OUNSjS4CwpHE/kKK1WaPodU+fqlx/eCSAg4Ff
         JKfdnJq1Mdoh0/9jnDYJV7aUsScQ1e1+yek5T6fmhmRre6GaKOV9+X+gh5n6VYji5zy7
         cP91VoQkd7UlPsT6sQNLQgrASptgDIxua4+Qwuwiwt8kiO4+vMxX9fbaB5K6cLSE/rXK
         b0Gb7YXsSMwWXlwIA8/gcDoz/Bhoq5UueiBKn4NGeRezNvfcq7wvbJzkBluDgik7K9ww
         RHNYRV1KQDD1n7uUINMDKF55Mam3jvwem9R+yySIbBzQPdh3gYIgn3njBJVIYGjHSKoA
         o2Mg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6asOGGL7jGB3aHhrECGAkDIExAdbe536Z5jhJehar0gDLyitdDz7pKk2++IrBAPRhnv1gwEH7CZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBVqlyTtfCVDujn9m9fpyPDFA0wjsCTVkpWzsaeOxCtg8+uR0c
	7XvNFEKKKU8zkAld7g56KQE6b2TMDPLOxT4HoviD5H8x8E/APYOxIgRqg8HNyn9ETmbuUQmXAvs
	6u007ZTkiuwjT1EwW5ebP7EZWiMBbbMmeqwkIUEw39T8P0lRHa8cFNw7pcjEFA/E=
X-Gm-Gg: AR+sD12SFp6XnsgOUSIj7kvxe6nT55OctpQ2nXxlpnrM89oqnZPvQqfigWOZnv6QtdG
	WRC1IEMAgNTH6O98jjK7Prf9MVPzSQVJF3fMp++q8JHD6x1KtPox5iHbGGambsLDFWXgHhfR/oK
	9JeOXF5tv5yVMYfpgXkf8StCunvFnFGcN020u8NfeFYZFCBNbsDbl7q0tgWJXWZ/gGSCMSbtQgR
	NrInmca79UfFL5f9XZRJ9C/QSGeBY37p83usMFAvljnYIEhe0Ey15O8ui6ldAAWXryIOFo9qixs
	Xgb5LiyuYLDWn2+UEhdsf4d5ANyuv39j6PnKhIH/YANvSWxNtzCo52hDnjvTAH1fDK52yvBjZWh
	iPrt3KRVU6NmJnh5+evAp1Kpe
X-Received: by 2002:a05:620a:839b:b0:92a:228:1bfc with SMTP id af79cd13be357-9371e6bf613mr231079185a.2.1787135661267;
        Wed, 19 Aug 2026 03:34:21 -0700 (PDT)
X-Received: by 2002:a05:620a:839b:b0:92a:228:1bfc with SMTP id af79cd13be357-9371e6bf613mr231076385a.2.1787135660855;
        Wed, 19 Aug 2026 03:34:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b478853abasm423113e87.5.2026.08.19.03.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:34:19 -0700 (PDT)
Message-ID: <0818e754-47f9-4b15-81c5-fe5294e536f0@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 12:34:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: tbt: Correct swapped TBT adapter type values
To: Sven Peter <sven@kernel.org>, Benson Leung <bleung@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski
 <akuchynski@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260818-b4-tbt-legacy-fix-v1-1-797831e3df3f@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260818-b4-tbt-legacy-fix-v1-1-797831e3df3f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a8586ae cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=G0XHSz-fAAAA:8 a=Oh2cFVv5AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=zk36CDiEbYcLe4RSMnMA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=9GzJQMQvVMogKS571uVa:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4MCBTYWx0ZWRfXzqeqL0e1I5d1
 fpFtzCXZAfVBvuWd8dz0sVU1flDCefvLFVfdejI5DRwX+Kzx1Oz1D2k3Ei4JZ3GpLJ7yZBjTWai
 DheEYhMw42E8QER9yQZNk1TSMeV3d+rPj2yJa8b4NKO9zMqIH+HmT3AcSjc+H0IumWTjdzR9ua5
 UNlGyhF9Gh5QFqKTFofVQPnjzCYIFlM2QsJL7G/Wu/49+vwodMDDBvJCZkfLIAL6SLWYvQOo57z
 FVO+pLu6GcvL0XJtvsc79hhB6xR4j38BCKg38/E8YbMvzoU/nEQ2khbcCftFKQ8IBnC69XEA4lW
 WltUByohOYC6iWnHAwluhbFryEcPEHkGxCmRq6Qx9KfY8en4bpcZ6u+fKBY0ClUE6BkgBrHFohj
 nbf0spp4/tq5nPrDK+wNSr8Ya4BsL8g5h5fNQXKDo1GMr46TDn3kHwnMiK1ugI6shKsOJ9Kzvvt
 DkRT5lHmsykp9mLthBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4MCBTYWx0ZWRfXysHC8DQ15SxV
 r/GaDnV7bG/6jnTyPrX6qHr0ntQmnCrCYimj91ZGjwswFPAhWYRjOZGbS2dGpTab56d8JHai0py
 pn08mi47zA8m9X5rC1hO/kFH6cZ/sNI=
X-Proofpoint-GUID: 2PGNz-IfdmRD2-YRyA_AN7wUeFfsRMax
X-Proofpoint-ORIG-GUID: 2PGNz-IfdmRD2-YRyA_AN7wUeFfsRMax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190080

On 8/18/26 6:20 PM, Sven Peter wrote:
> Table F-10 of the USB Type-C Cable and Connector Specification R2.5 on
> page 412 defines bit 16 of the TBT3 Device Discover Mode VDO as 0 = TBT3
> Adapter and 1 = TBT2 Legacy Adapter. Linux has those two swapped since
> their original introduction in commit ca469c292edc ("usb: typec: Add
> definitions for Thunderbolt 3 Alternate Mode").
> 
> ChromiumOS EC's include/usb_pd_tbt.h has them the correct way around
> and references the USB Type-C ECN "Thunderbolt 3 Compatibility Updates"
> as fixing an error where they were originally swapped which is presumably
> where the wrong order originally came from.
> 
> I've also confirmed the correct mapping with an Apple Thunderbolt 3
> to Thunderbolt 2 adapter which does set bit 16 in that VDO.
> 
> Swap the two values and update all users. Also rename the old defines
> so that no user accidentally ends up with an inverted value.
> No functional change.
> 
> Link: https://usb.org/document-library/usb-type-cr-cable-and-connector-specification-release-25
> Link: https://chromium.googlesource.com/chromiumos/platform/ec/+/db93814b6e73c8545d23714fe0674c10814d901a/include/usb_pd_tbt.h#90
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> I ran into this when bringing up thunderbolt for Apple Silicon SoCs and
> was very confused why the condition for "tbt2 adapter" vs "tbt3 adapter"
> seemed to be backwards.
> I think the qcom pmic_glink_altmode.c actually has a bug there that was
> hidden and/or caused by the wrong values: It used to always set
> TBT_ADAPTER_TBT3 which sounds plausible but actually claims to be a
> legacy TBT2 adapter on the wire. I don't have the hardware or know the
> intention there though.
> The other users look correct to me since they just pass the value
> through.

I ran into this in the past

https://lore.kernel.org/lkml/20250926-topic-tbt_header_bit_fix-v1-1-122238af5c82@oss.qualcomm.com/

where seems like back then I misinterpreted that the intel driver
doesn't need changes.

For the pg-altmode driver, looking at the FW interface I don't see
any info being passed to the OS regarding tbt2 vs 3, so we should
presumably always assume the latter (i.e. just fixing the header
is enough).

Konrad
