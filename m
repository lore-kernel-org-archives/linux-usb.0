Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469822;
	b=xJoA6xmXEHMRvGecSE9887gaVIUozRogNu0JEff4tKC9fpTC51itDFCHMfIE2JKO2idv
	 h6zBVU2kbGlMX4rmVBF6wFq96X8KdWjXlcObbFIrAlXH+BI/qeUkH/MDepejyIFd8pK/e
	 t0ArdqsrB7q20RoGDFuvVrQ+qb04Fh5CXB3ktoQQgxZGl5DMOmEyByZnF+t8sOnv/D0sJ
	 jy+z4QG+XwaoOv5F4H2ARvhCqHEq/3uMwRNnZdil5i6trCJUZx6M+C9HMlYkWfqV90/2O
	 NiPBlHiOgLbEuLAk7M6Ocbop1JeNZvaXFzbETwlBIt4kKE+p4qyIfHaZf0zAT3Idl3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QgHcQ6hVCrK3pQvuLdcyazrN9FghjE4nbTNGDRYcMbg=;
	b=2CuNZ6cngo6yJFbRaC5EzpoA2GNZmQ6uNHt57iYm1RGX2JgBPhNvDxE+KoUtBlgCEenQ
	 sC6HtbetUMAnV3mufvrIaBBUnU6uAboJRoj0wNgNgXV3laTiFIEXv9T/Tl3xTtdozli5e
	 KH/wqt940jRd+x0hXR35Rzx92MA/zv0Fv1l8IbERE09WZqXiL71TTIl+CPYoRJjRidgXO
	 x2BqJwT6eyzXIG4y6yEbmhuRge3rfycldRkjqS+P+SWr/z4yyw3oc1IJ3lA1rI3d0/qVW
	 5c9hk6KxIDoXOw388kZWjuXpKEUIlAhOcMBMcNEH0T9vELUm4cBuoSvesNgeLZ2yUxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0pvB+LE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CSd9vp4d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9C0606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 21:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B9C0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0pvB+LE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CSd9vp4d
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuZN71579821
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 21:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QgHcQ6hVCrK3pQvuLdcyazrN9FghjE4nbTNGDRYcMbg=; b=R0pvB+LESdxz4WbL
	dbApRq0mOJpWAyZSdyKwhZUFbXhlI3BR78EenLBPW/Iz1cFc0RKpzpBKTl/j5Qav
	lyRNVnsplbBV+3+Js+PFaWmpzbOnCWZxpTOiIQJtx58U0Khqh56tu0v6Zj9TFtw9
	L2s+VmH4pSUMIe7vxnqRNNgU2uPnOfh9MEk5DOQf2HCBL4T33SoOzTayPpLcWhTH
	9pUlxSbZgaJNU2dOobce7/334mgr5geNuWJNdSI32ERuLLH716U3dUodUIpxMqJg
	7k4z9g1lLYpi4BtXslEWTDuByDP+Ux+otZhRcbz7/3gY7MXbtdXPWvHvGlROdeyk
	PiCddA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0tg6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 21:37:00 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b63b9665so2909381c88.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 13:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795469819; x=1796074619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgHcQ6hVCrK3pQvuLdcyazrN9FghjE4nbTNGDRYcMbg=;
        b=CSd9vp4drp7PRK39yqFz4YyZ5jHMjoV/O7spAMHj59VMZNpiDg3Jv5pBfw+O6CXjj2
         LyX/C9ETODKZ6q+kTBkf/5afBaOTBBzcXjnTffCE1iwuCqyIwR0mkdvh0tbIvw2iWRAh
         YjrZ66YD0eXNUiK1Z3Px17VFmWjyunaOE4LQorBRGxAQrO22PSeFD+cUP4Nw5o3IJSDd
         8U243/fYxAsHcwKIvvsS1V08rx4/SoHkFBStuZFCzeqhpuYtXZwVc/4VExQLn317/Xwq
         y6l4IjYtjwYtH1VHIaBR9iiudSo9eGLfl6VBX8r6BNByev1BDPFayxWztsBWpxRJ/p5c
         C0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469819; x=1796074619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgHcQ6hVCrK3pQvuLdcyazrN9FghjE4nbTNGDRYcMbg=;
        b=P0Jb5kbJOxEiPzNU0vvIUvHV7pW5gkEkLM2kSxDZj4OK3xV0v0TVH6r2Inu9fVlPxA
         EFM3F/ECH+O1IrI3Ri8FNG3VlUBvImRmX2RrpOO5utpl5HKDDLE4KS/SWZJcmbIwggkS
         d/Gd+mr17MX63mArz6v0YxHL5GqAslvohzyFoAO7jaoLYmXoqry+u6WISWAUj5OmsLT9
         b9GzDkAyZCp5HxfTOwcQwn+wQ+W+oC03eTGlv9r0kTy+zs87IhH2LZvoO0CAJfHbPRpp
         vI2+jHAWXyfvv0wCT5/ot6gsc/mgpUprDu9fkhjQg7f4YKRF86bQkn7/0zIhCWNIAqor
         L5Fg==
X-Forwarded-Encrypted: i=1; AL+hErHns0DSdc+oUsfzv+s0zglvnJzX1qHDCSFSJRRTDJ5ZhVUWmswPtdXXvh/Hekfbn2rq4+F+jr8D+q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yHitm0J5jQpnbn9J0RE/KrVijscBX3GjofNWcs2vjhGYJ1gNb
	NTmzBHCujT77BwRdMj9JIRJfWgApqauYSkG/mEXJGhRNHSH9BmgM7Za4j0nrHgrQjEfqmS+nCEI
	/lLuFn3/XE5IfxPB3yK7USElek+j2pfKqZ5NXTjMEPtEBCT95qwy53TOJuCXC2Z8=
X-Gm-Gg: AZFdTZcSsfZ5D4/QPo5qCHPXqMvqQbcQG7ZTu2nIe1YaknBBorcwpsNYo5ji36qGjjs
	oixP3m+iJadC7n8hecb4nlp+6MeH9NnZtrmpYYE7XKvYHLHh53f+bAbeyLwlJ3CORSf5n+p9grG
	StUY60oD9upYmTRpFCAh+vMRYurAc6SyHxPoTz/Ot7pymKAOSDa7OKb3oqUdYjeKg//FLTwo3Yk
	4ZWIseg1ceKzjoEg/vsr033LdeMK7nG03NGIc6oPDPFKwiGA3z68G1ZltBxnXysGqwPRwO6D8fm
	J+LqLDA2aQFySYMTlhoyxxEWXz3oqtntIFlhPpxLvNSoF9Ak98V2vtJgGnEPzkTfANSmR/Ve3iF
	OFhlBFWZhLR6zod3OZztcnoS0TnNCE12wblLgKlknuOQ7nZPabS7g87cTjmAQJ6JWjWUXbFtNGo
	ZhYB0=
X-Received: by 2002:a05:701b:4287:10b0:144:fd7c:84fe with SMTP id a92af1059eb24-1b556925d65mr13386170c88.35.1795469819324;
        Mon, 23 Nov 2026 13:36:59 -0800 (PST)
X-Received: by 2002:a05:701b:4287:10b0:144:fd7c:84fe with SMTP id a92af1059eb24-1b556925d65mr13386135c88.35.1795469818715;
        Mon, 23 Nov 2026 13:36:58 -0800 (PST)
Received: from [192.168.1.136] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm29552288c88.3.2026.11.23.13.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:36:58 -0800 (PST)
Message-ID: <6ef26d63-6416-4935-b379-942b9787926f@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:36:57 -0800
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
Subject: Re: [PATCH v10 4/7] usb: misc: qcom_eud: add per-path role switch
 support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
 <20261123182847.143892-5-elson.serrao@oss.qualcomm.com>
 <sashiko-outbox-229887@kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-229887@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Q3XNk78Z318YWWshxQJt3V7M15zUDQXk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX7B0ME+c6s+ki
 5ePiTuxF0A0tleLCUTB5Fu+uo5xsMNun2Znhe2M41b/dzRO/Ukg9sdWoRduUwx0Kq5daiB/vI0I
 NgVvqiToe/PMxrZPH4LdJoZJD8rHcPI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX3Ay91QPCZT3v
 8ScQHsl+m3NhEbja/Q0aPzXsDtNw8HyLYK2LzyzJMWx5bR2WGjzGjtd9Ev0Mqx8nbsd8vQILbls
 aEXd3V00UL4oXdjpj85HAqK3vLR2hwmw3aXIcehU+7fPRnyDYxUf0qBTOeKKHv519wH07vVSNTP
 gzXuimLNc8IPdxrfVMbwe0ZqEKhYLl6zpBPrH6zwhc8iZ/RatHF09KQbDVwL4diFuYk/W9wEeBZ
 kiwT/sy/zQo5M5Yri06DbE3UHQzfh1v2A9T54jmkZlhpTHZq+dKV4H7r+7mS4i9tzmIn5m1y7bC
 OPd3dux2AKX1A3m1IQbX9GwfVLensFE1pZMae1E6b6gGmoC+X5xuYw+ik6w6EXVvGHL1TcRS1yb
 nkN6LXRmRB5IMs5Sf5yUXo9ZcznjQ7R198YqwjWlGYO/YJxB1wznlDwArWqC8WwADYFgJJYvdHA
 gyCDBdppxZ8s9OGl+jA==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04b1fc cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZiEXcGR3oAm6HCNq-lwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: Q3XNk78Z318YWWshxQJt3V7M15zUDQXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230086



On 11/23/2026 10:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] usb: misc: qcom_eud: infinite probe deferral and wrong fwnode
>   in eud_init_path()
> --
> 
> commit 9854aac37e71428a22eccd3000ca7589c021cc4d
> Author: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> usb: misc: qcom_eud: add per-path role switch support
> 
> This commit replaces the chip-level USB role switch with per-path role
> switches that relay role changes from each USB connector to its
> corresponding USB controller.
> 
>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
>> index a3afa3bb93481..48e474bdf818c 100644
>> --- a/drivers/usb/misc/qcom_eud.c
>> +++ b/drivers/usb/misc/qcom_eud.c
> [ ... ]

[...]
>> +	role_sw_desc.fwnode = of_fwnode_handle(path->np);
>> +	role_sw_desc.set = eud_role_switch_set;
>> +	role_sw_desc.driver_data = path;
>> +	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
>> +	role_sw_desc.name = path->name;
>> +
>> +	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
> 
> [Severity: High]
> As reported by Konrad Dybcio on v9 [1], will eud_init_path() defer probe
> forever when a controller omits dr_mode (or sets it to "otg") without a
> usb-role-switch property?
> 
> When a DWC3 node omits both dr_mode and usb-role-switch (such as
> usb_2_dwc3 on SM8350), dwc3_get_dr_mode() falls back to
> USB_DR_MODE_PERIPHERAL at runtime and dwc3_drd_init() never registers a
> usb_role_switch:
> 
> drivers/usb/dwc3/core.c:dwc3_get_dr_mode() {
>     ...
> 		if (mode == USB_DR_MODE_OTG && !dwc->edev &&
> 		    (!IS_ENABLED(CONFIG_USB_ROLE_SWITCH) ||
> 		     !device_property_read_bool(dwc->dev, "usb-role-switch")) &&
> 		    !DWC3_VER_IS_PRIOR(DWC3, 330A))
> 			mode = USB_DR_MODE_PERIPHERAL;
>     ...
> }
> 
> Because eud_init_path() only checks for explicit "host" and "peripheral"
> strings before calling usb_role_switch_find_by_fwnode(), eud_probe() will
> fail permanently with -EPROBE_DEFER on any board with such a path.
> 
This corner case was discussed during the v9 review. The consensus was
that EUD is expected to be used with dual-role capable controllers,
while support for controllers that resolve to a fixed role at runtime
can be addressed as a follow-up improvement.
Link to this discussion: https://lore.kernel.org/all/23131f02-0df2-4875-a409-b9c9340d0dd7@oss.qualcomm.com/


> Also, when np is the legacy "ports" child node (handled earlier in
> eud_init_path()), setting role_sw_desc.fwnode to
> of_fwnode_handle(path->np) registers path->eud_sw on the "ports" node,
> which of_fwnode_graph_get_port_parent() skips in favor of the parent EUD
> device node during usb_role_switch_get() lookup, so the connector can
> never resolve path->eud_sw.
> 
The legacy `ports` binding does not describe EUD as a connector-facing
role switch. It does not define a `usb-role-switch` property on either
the EUD node or its `ports` container. As EUD is not marked as
role-switch capable, the connector never attempts to resolve a role switch [1].
Therefore, the described lookup scenario does not apply to the legacy binding.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/roles/class.c?h=v7.4-rc4#n131

Thanks
Elson
