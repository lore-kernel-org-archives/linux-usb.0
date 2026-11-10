Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314641;
	b=OuVm3BodJfwpQlh/EFXswOIazLzasMoMmEA5+9heQGIh994CCJGcHFfTCXlk5qGGHAyW
	 qw2S6ywSjInzAO9ZcgFDPd0QNHnWxxKDZuS1p8cj3JRA5MBjcFaYLIx0ZMy3DUdUsLwUQ
	 mHudXwSKah1RMuESrMWJszTmLKIdmouZ3HAXSGDOGYriIGwj4pFQVG3HJmzF3NZgx6JQH
	 x/NJLzJawIUaSX+QRyZFuYMwNa2xVUq0RXkAfJt9uzNKcMFsDHurI/Xquacl6bwr5HQR4
	 E5kGDCr7VCvOSoiazKcg3ey2F93tkRtKxZE90YWUTDB5qqrILWyIkztHePae3geL9YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314641;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=izXQc1m6uJs2OWW2AxpmmxzIFdzwjCtP0swelOYB4Bk=;
	b=wka9p74aLEey4wgmiAYuqnemhHufA7qnVNn3F18+ltNDjRBGXCHsBsFo3d+75EpRRlNx
	 sIEWk5mKSK2w8fb+WoyIK3zb/Xsj74R5mdp+K/TlJOYYqB4dSB9JoGEzIno683OeQo5+Y
	 uzTOCqZoWS9FOqJOeINKpgNI1YOREcprV0SAcETenEaLHtfzcH9mWvkvnhETig3Y0cvu3
	 Ar/7BoL/Aybjj2qpFRK6pZZ4KkbldGFaNElk7OQb32WvkiE5Tu2ErfSPugwqAl5mzXwiL
	 M/Fs+Doptu58LBXKOEpckik8eeegUTyvS+LOKfOjxZ6BzvaN34Il/tS6E7k5OtSObeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6P0WZkg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rxw7IcyI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3907606A326
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 12:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3907606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6P0WZkg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rxw7IcyI
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB9pIP3228343
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 12:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izXQc1m6uJs2OWW2AxpmmxzIFdzwjCtP0swelOYB4Bk=; b=a6P0WZkgTx1O2z5a
	eWvoXeu/0YND7aUSKP5NBPSFRKeZ2/KKO5D4w29QG8P3UQWrpBMkVqdskm5O5oEA
	efin8cyC/TZr0KiA18DPQXtTztS7HpioE9p2D7D+xk3B8H3WAWRJuEhXlzRAvc9R
	21XrmnF8MtzVpxfGWnCbNzzD5fXjZXsB4RQMSoTmmpvo6zMv5okZwuxJCFu7BRaF
	TNhYLXWyfh/DR2BltLc7Ehdxq6cDHTPwr+Jq0rm5XMHJsNkTXiLlYIcrWsVKqzEM
	AJoywVsm+kaFybTO1z7gRkOMQOC0+Ck8qC5FfVto1fD3jSCOheE6rdWGp/isb6Ge
	8E70FA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5d91uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 12:44:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso44314385a.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 04:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794314639; x=1794919439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izXQc1m6uJs2OWW2AxpmmxzIFdzwjCtP0swelOYB4Bk=;
        b=Rxw7IcyICV1Nr1du+X4UmRZyOKKscSeudv+bLOnojMafCKBT3tmR24I9zROAB0bIXw
         nbEeSXgiU1AqokLBwOYV+sSLCu8qSEkqFvipOL/87hx9T/ZCjrAOhkBO6/sfUhQTR9uu
         DebtlrkLfWyOxFMPvMSjWcAnD8xrxYrsJ1cYuFeaYhhN23vS/rxhi4Wtojmu7nEfhrVi
         G2k+Y0uVNInB6lYKFBW2kGIdaMTD51JGyXr6xz+s5+oY6USFFRJ8/p8nwvufIpZK/7La
         OV1YSvn7iXiQauhlIrbGeX2nsKs6UMadS+81MhFZKUilyXljBeKvnQ587gLgMUmZhGjE
         +RFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314639; x=1794919439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izXQc1m6uJs2OWW2AxpmmxzIFdzwjCtP0swelOYB4Bk=;
        b=ylp7agOkRZ9DWRo0pQtlS0L0XC/C0SGBSUMFLtu56Y6ohRdj9icWA1Ko+Lsgb/Q9gy
         fUWzjMHoBxS2GqlGFnYduevoC2DW4HedkmtKTw8sZbQe7DCUr2W2YvPCvV4oDIWwwbFS
         8GHvpgOchiNceET3O7katnk1dzWViVydymvpyskgZGQtyzJWRrQn7tAbHKs2QrQlfu6/
         qDd8UeZk+wDtSpYqJHDOkuznTfVQrMfmQ8EZXyd59bttW0RjPrllWhQ6l0u0EXVAlJAJ
         uG6PmigBPRsoha+m6fjndU63G31OElspIgF4yAET7XgmE5HKAT+B9ujUDmdIz/KSI8RL
         lrXg==
X-Forwarded-Encrypted: i=1; AL+hErElOMj3GvlYrsFUyWqmVBuG/zYmHydTVsqb26slW/qlxvuvsIM8rGSx/HmFO+4PnC9ImIPPzdZD1Jw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gLLuQ+SrzBZYdKURlZ0YIPI+L0FcLY8WkQ7w6iS0YBG6561OF
	GLW4Ajir0+zfFDsNPJOqxKB1iE7UDjKpMb/xmnO5oV1XbarkNkXgYOOnsOXcQBzSlHiRQD99sjk
	f5fZSW20wr6cqqLPsgcnZUjfyLhVufUPQ1hBSbNfY3rNujsbsK0yRwr9MmrowTzk=
X-Gm-Gg: AYBFou0gsMWUeAuHgRpaTtB/jCd0OtFxG32RYc6DKgU0oGc0nyVdHbOigJ4OY5B8CLx
	NAVaqGGvkC6HtuiqSIa5AWaeLCxYTmQpUY6g4UwxX6X8+k4bi1Dqt604HDTQnB/1d4PhcGtpgHE
	95Q1d3m2G+anzIU/wwi1l6B+wmaGTGa8UIqdOHlVdMcyhqIhB0PkWdDbLpeuv6h78F5phnbCDUM
	Ewr4trLgSFM1Tu1P8yljfeoT71q1UEXJr+ZJQg1r9PDDUD98vZ941+LgFLns+gt8p7pi53PCoYZ
	ns2UJSIkTGAxW/zSV+fvXxEl5xP5xR1dlbT6ZkMG6lP30OGP+EPW/+RmOw0JHhOQv/qtY8MRBN8
	6XMKcyHh6Pp/KlQAJ3x2g8ReeyVmulJoNDl2mwWz6s6lg9O125wr++seWLtwsgbbAOwAGIEo=
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr352548685a.4.1794314639177;
        Tue, 10 Nov 2026 04:43:59 -0800 (PST)
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr352546185a.4.1794314638695;
        Tue, 10 Nov 2026 04:43:58 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6551efsm103736966b.68.2026.11.10.04.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:43:57 -0800 (PST)
Message-ID: <830a0984-8938-40f6-9400-5962dfbbf274@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:43:54 +0100
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
Subject: Re: [PATCH v2 4/7] thunderbolt: add platform NHI driver
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>, Sven Peter <sven@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-5-chunfeng.yun@mediatek.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261110114925.722014-5-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jP2vXHB6r2poJMoEqtsb8WACYOvrWgf5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfXwEhWafxOR+WP
 yZ8hVp/Lc9f1uSiLNcio07iWl/8IaBV2Xm4oDGJJEuvs5abDg3RpWqzsUFkJBY10WR9Vzm70VAJ
 2Lt68fKjSkI7gPQarbq3gc65VtPmh4Y=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af31190 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=mpaa-ttXAAAA:8 a=1GaHgJMAeWfMa6zh5XUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: jP2vXHB6r2poJMoEqtsb8WACYOvrWgf5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfX03+f8i6M7B4w
 juO2p0tY87Zp/U1+oxwU7fWkjcMLe8PcsW0GFEXHL4f8WYhRM3MjVwQLp7pmEWr+2cUT1MT7cqY
 axd+PP0VL66S1wHe3Fn8drdaWT2zhEfOypOdHGlXuwYOmJF/dV2d/lr/Ehpgvpktr5tRMqIwqMt
 Jv5MDxaP8MHHCkFHEYe2zB6yN7GYWekyB3QswK7N7hLsf2YnXOo7v/kbJS3yt5fmOfz3cRSWWzo
 uOzMOehS5U/GLil6NFed6mM2X/rxiSlOpgPJscKI3PHGJca42LEIzRe5uUuaqzq3vR8OlLf7cHS
 7r9PD8Tc3I8FghQFh/xL2blhQj9+wMEdikpZtOTQT98ivd0n3zc9eJnrycFFBffCXm/2zLG367M
 JN+ajH9sBMk8W0ox6wSbiiD4aBlgIUXXd6LWU1dgPBXws3lI0bQNdr2SutTJUqSj/1GDOXFo6Eg
 6orY7UY7uCmfuKuj6vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100050

On 11/10/26 12:48 PM, Chunfeng Yun wrote:
> Historically, the Thunderbolt/USB4 Native Host Interface (NHI)
> controller has been exposed as a PCI device handled by
> drivers/thunderbolt/pci.c. However, some SoCs (such as MediaTek
> mt8901/mt8992) integrate the NHI as a memory-mapped platform device
> described via Device Tree or ACPI.
> 
> To support platform-attached NHI controllers:
> 
> Introduce platform.c to register a platform driver matching
> "usb4-nhi-platform" (OF) and "ACPI0015" (ACPI);
> Implement platform tb_nhi_ops hooks for pm, interrupts related;
> 
> Support an optional dedicated wake interrupt: on integrated SoCs,
> the MAC/PHY reside in a power domain whose clocks and power can be
> gated during sleep, preventing the primary NHI interrupt from
> acting as a wakeup source; so add an optional dedicated wakeup
> interrupt which comes from the always-on power domain.
> 
> Clean up the unused nhi_enable_int_throttling() prototype.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2 changes:
> * Added CONFIG_USB4_PLATFORM to build the platform driver as a separate
>   module (thunderbolt_platform.ko), instead of statically embedding it
>   into thunderbolt.o.
> * Renamed plat.c to platform.c, renamed internal functions from nhi_plat_*
>   to nhi_platform_*, and updated the Device Tree compatible string from
>   "thunderbolt-platform" to "usb4-nhi-platform".

There are still no dt-bindings for this meaning it can't be merged.
You also haven't answered Sven and mine's concerns about this being
actually used.

Konrad
