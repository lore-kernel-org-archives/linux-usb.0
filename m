Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466385;
	b=U0hF89XdtfEDU/kbDIZgF37M7x9dBxnpi8W1xP2kUZOrofod3Depe6UfUFXzy5t2VI0P
	 MYe5rnZ0x3H5L/AoMcnsWKeGulGXFBKy4YWbfiWapy466NdKgBrUvsr0QOh93wkRcx8Hl
	 mUE3FkUV/uft0oobJNdPrZiiZC2r+09aw9mpMGLGxM73eYYB/k1k4iZU/L95Z3bb9pq4q
	 z8dCec7+ELrJDuUW3nDuRefjlbnxww67RiiBUs8ykIw7+sBDL96/W/iBSzTtZC0qj27ri
	 W8smE/99s2XT3kcoMJ0f8IVaO1waDksfVfsNwR9jVt0bWjnk3ElsLuSr/m2dV9Pqvuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BTgZDhQmpiOfvJh/U5FMsjjeNKUBRVaNNccXn4V5Uew=;
	b=SyjonAyhTF4/aUzxYzRJAQALRwlh8yiAil8tZJ6NT8XumeVb9qnfug3b1hTpVFD1PzaG
	 cn1xfXS0g+MmRpoYl7x2xqEKc62RzdiSRV4Xvbw9e+5nNjCFpPdWqLFGLNQUTW0BtGqAH
	 0Ff6i48aPEJP7ZmqlTbBPF7nCxeAhOfpmZF6odL2nP4VDcfAS8j0j7lU7ogUqXIsmGFWd
	 er/oI2OrChE/EgoARHua4MdLHnCQCOdxYmHevxCgAl0AOKrvqJqmV72ei2+AL4AHdElC/
	 Tpx9EvoxDxYjdHuKe9yF34HSRlU/3sRqQ+DSCRi+OGmo+c75kxbCV9tCFuAhVso9yTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FayhAM+A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KDp4APLK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6F2606A326
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 20:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E6F2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FayhAM+A;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KDp4APLK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuRWn3255335
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 20:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTgZDhQmpiOfvJh/U5FMsjjeNKUBRVaNNccXn4V5Uew=; b=FayhAM+AHNEAkIR3
	b8N9FmOqGz50xqkCk3OxEjpXss7cnSc+hkWsGqMr5+5F+exNlH6zrJmRTf13PDBl
	S+Tdz8zo5FIavg5QxQT/LE5mP/6UVBuJ4i8e+Trvikfj9oz7hUOfeUXnHlg0FrKC
	5ZUqYnbBtxMkB1Y5aVmTYgJL6zMAwjZhFNqYd1ElIdCIsIj3jahFnKpD+hHMit7Y
	iplugmpv7hd355++o2C9Qsne7X4Qe/19c+1DnQn90n88YMIB0X30I5J+rzN9M01B
	ig09kUJg8ijwhrrJoFCb/qSbAREJbe4LkuJYxc+dQsldu5RztJOzS71BBoYiIpqH
	Q16kQQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pbbcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 20:39:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a7af8b94so1762600eec.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 12:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795466383; x=1796071183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTgZDhQmpiOfvJh/U5FMsjjeNKUBRVaNNccXn4V5Uew=;
        b=KDp4APLK2qxP1LuoiC4ykKW5vIVtDrQOp1pNKBKZVex0wyuXphn9NdgBjC/joXLYOX
         TaLZ0P1PiFCFx7PgoIpH5TeAMHTE2tT9/1xE74EIjS2n52AoscxKK46xT9LO/KtaAa6j
         zt3f3Fq1xkt2hckwKjykXyJd3Lfmsa3Gjdtt2LizsO3hOz/9cat3sy/U3nuEpiz1jyyM
         UQez8pBRfW2+c1Ca+OK8VZK8ICUWmC5zBrCtc+p4rx+gHBHLpEr4bek2b5vWAOylcnKj
         TKNSCYtLYSQ/WjiVJVv9QvBLYXdD3bHIy+B8qkPbUZ1bps4tlSYuSqhk/URd6a0YI45x
         RTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466383; x=1796071183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTgZDhQmpiOfvJh/U5FMsjjeNKUBRVaNNccXn4V5Uew=;
        b=vxGz2Sn+5PiqSKr3MXy8/dk8CTerZB88sZYJuGoKnmVrfyJuyRYFmCur0QJC9ij0KM
         6cgyv2KVqxC74vrG9N616NcHvPXkcyS56je7h3rONJFv0WjYUVfSnNs9qmVozshSv6Ef
         k1AyhMwruRUZ6d4SJ4o7e/LrL0cS6dO+/bqyGvl4jbsKYlWzutL30sTyjgdIeuhUv0TL
         CknNE7HbBkLA9CWUzXjpaTbCPePmA3YHPBfk7FgWuAwnMCrIKDYzVetiX9fVvwk7SaMp
         U4148N4FmyLq68TciGaH6YlR0qFQW2y1b7VU2SuALUOv9RMdLW83CBKHeo38FkcXA+ZK
         ug0w==
X-Forwarded-Encrypted: i=1; AL+hErG9ieV0n9R/msKdxqqIZgqJn3wSNYhG/dcQ2jRVGra3htRI8392FUeYGGJyX0UupQp/0d8lPgBSDs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HJaIHWH88J1Gk1leNi0B1Y8id/fThUZWzgT9jNL4W4ZqPVYcJ
	WGvhhqh9kJIh0dIgnYVjjhjFtZZzlveWgxcREst3dVGVSmVNa4Zf8dRxzUPLdg13ogyq6FY8JHH
	tB/NaAPAZ9KLnxq6Xwc2QLhkVKO4O6p4kKpkR/o8B3JPGdatP5LmTZCjtFE5UAHo=
X-Gm-Gg: AZFdTZc3kan42Ixz1TqQEV8Dw5WN7O4zh2qaD9sYMkM6vJFnDLTyYehnCpSI+snmQJ0
	0tBPN+q3lBWSs6tw1ZoA0LTU8hQ9H12SRyYYdbxqGhc7avTiCxh1Br5nKm5wqFZPfyvyi7jc7TN
	5So26urGaCyXVY/lchyKkUTk5rNt1qcIQUsey7drSQBaNh9IgttdNVT+KVwWowjZd0pn35VumaE
	dLq0w/pfQBvYzFb+EWztAGsVmEVdur0NDXudYZLSaqGEvYD102WALyMo/hg69QWuh6AlDeXLK6s
	9BRlHS9M+A7PoZTkUvmVSA9w+rD25jVwPH3iyf2f8iQqHnAxQeZMhJAwlmv3jUO/4AIS8fZY5cX
	2/wdhg8xcD/FsIK2cw1BEF9ONtLzbc6XqQLGnhR+gi7Qz//1HQey9T4SAOde4PwAP2m0WFqqhV0
	rtOAg=
X-Received: by 2002:a05:7300:ae04:b0:384:7a8f:3bc1 with SMTP id 5a478bee46e88-386a8562bb4mr6348376eec.17.1795466383277;
        Mon, 23 Nov 2026 12:39:43 -0800 (PST)
X-Received: by 2002:a05:7300:ae04:b0:384:7a8f:3bc1 with SMTP id 5a478bee46e88-386a8562bb4mr6348357eec.17.1795466382794;
        Mon, 23 Nov 2026 12:39:42 -0800 (PST)
Received: from [192.168.1.136] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm35843638eec.16.2026.11.23.12.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 12:39:42 -0800 (PST)
Message-ID: <e4059318-2301-4362-b308-ba915ca8310a@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 12:39:41 -0800
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
Subject: Re: [PATCH v10 3/7] usb: misc: qcom_eud: add per-path High-Speed PHY
 control
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
 <20261123182847.143892-4-elson.serrao@oss.qualcomm.com>
 <sashiko-outbox-229871@kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-229871@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MiBTYWx0ZWRfXw4eKWrm0T4xu
 VONYqX6TedGDxB4Lo3Cb6Do8s/vUv/iQEi1vnyxZ7iQqdhnpa9i7EAAb16EwAYo1l5LKX8l9VYt
 f7jBPQnR+mxS5lopybkZpp6dwRUx0OOtk7TilkfO7VmrOsoRLmV0jO8SqUhCvoxmCCLKA6CgO55
 ft5tgvKxKhZzDE4t32sSChpNfRtJ43I8oHaXbHqb3B18li3L9AcYPLJgtufCILFNt6vfMTfVXI9
 3pRR2yYG2gTyfsEo9iFHJenypBQbjyHkC/gk5KbmVnebyJiPVsu2wogC9wa3AOB+Dh2zkERDlgS
 wlT2Lo9KkwLTvyHe+41Reu7Wl6iE7buXmG2JBbRMp3tHUsYYCREIJ5yQN3FSumDRj8gYy/0fTT2
 4qidsWFVBvkUh74AStdw559CyVRHNQBAo4HS6fi2A2WS76J5kowkLkdBKYeAIAoPL7dfNXbgVtA
 2gkxCE1bmgXjmj8ieuA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04a490 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PwTwPomv82BVMpG07ZAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 3SKniBls10ckpB4qGoPYq0JbQeeEh2pP
X-Proofpoint-ORIG-GUID: 3SKniBls10ckpB4qGoPYq0JbQeeEh2pP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MiBTYWx0ZWRfX34FgV1/lTGxO
 nzeqecpv0PfWXOOD5ah2GJhoQ4lOvg/G04Y8/gRFmxWFHOn9CGz3Gfc/Kq7liwfFy5XltyC0X+c
 Yk/JwoyIUMXgTa5dELZoCVaC2XhM1ak=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230082



On 11/23/2026 10:48 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: misc: qcom_eud: eud_probe() fails when secondary path is
>   disabled in DT
> --
> 
> commit e2fd91a7c0ed5f3452a494a0a91ef1ddd34b1c26
> Author: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> usb: misc: qcom_eud: add per-path High-Speed PHY control
> 
> This commit adds per-path High-Speed PHY management to the Qualcomm EUD
> driver so that the PHY associated with the selected UTMI path is
> initialized and powered when EUD is enabled.
> 
>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c

[...]
>>  
>> +	for_each_child_of_node_scoped(np, child) {
>> +		ret = eud_init_path(chip, child);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	/* Primary path is mandatory. Secondary is optional */
>> +	if (!chip->paths[0])
>> +		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
> 
> [Severity: Medium]
> Does eud_probe() fail on dual-path SoCs when a board disables the secondary
> path or its USB controller/PHY in Devicetree?
> 
> for_each_child_of_node_scoped() visits child nodes even when they are
> marked status = "disabled" (unlike
> for_each_available_child_of_node_scoped()).  In Addition, on dual-path SoCs
> where the SoC dtsi defines both eud-path@0 and eud-path@1, if a board leaves
> the secondary USB controller disabled then of_graph_get_remote_node()
> returns NULL (failing probe with -ENODEV), and if the secondary High-Speed
> PHY is disabled then devm_of_phy_get_by_index() returns -EPROBE_DEFER
> indefinitely, preventing EUD from probing even for the primary port.
> 
The binding defines both paths as required for dual-path SoCs (e.g.
SM8350). The eud-path nodes represent the UTMI topology between the
connector and the corresponding USB controller, not independently
optional hardware resources. Therefore, disabling an eud-path node or
the resources required by it is not a valid configuration for a
dual-path topology. Probe failure or probe deferral is the
expected outcome in such cases.

Thanks,
Elson
