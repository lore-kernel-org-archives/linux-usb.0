Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FD03D890C
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075433; cv=none; b=HhWvWjF7Gj1qnqa/R59zb+ZjFBoQ1aQ82zjyIeWi9LHes9W9pYVp15o2sZCO8G/nNQz59XH03TOtPCcCAV6N0CeuPyHuFR+mWEUNtpbCWZjgZO2zJrH68qtRwoQcXDa8/xPG5PN/5VCp8uFGTPWAE8Jb0OJrXewfzzZfXUJYTVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075433; c=relaxed/simple;
	bh=DXjyIndIDwV3dd6kJq4K5YDy+8+s7quV+iZlTF5mzCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAVeduAffAJAjzRiwi1JnSE7lUi50SKxtUf133E4JXbQUwLDtbNgTn2/QbjORybuRlQ2hMcEaY5sGBHlU9FomdQqxb8CU5XWZKIEN11Izvn+FQwuGHkcaeaQu8fFb4qDzA8buhHLeGwcATzKTUYoAkXIDV+uG4mVbyji36BFGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjaBIApH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cj90ylFX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjaBIApH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cj90ylFX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPdex4100193
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 14:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ctsq3+iuFi3MtzssQO1t1IJwSkNjscSenYh4eM7gop4=; b=UjaBIApHvRcGsN3E
	zZg8lbX6CeNRwMA5Bs/oJPMq54LfOrzquf+qSfrNDQPru8CieubfmHPWMRcUKuD2
	w2THhpjkRYBPQSBFpisG9cQ04zwqgauizi/uANJ9oF0XlyACIi/HDgOiqJF2IY2G
	vheBEfPmOnjpltaEtouQ4k+c1iMAdmCiBu0T1joYJj/tqo/56WO/64GhHyEksALa
	XV5tK1iuwlbXbKG2QyD1Pz4jRsCJd+Gy1bMi6YbHOcAUuM3B9GYw8WBeKZxtAenA
	qutyrf2JLWqNIIH+BuXumNvUlQPh4Oh3AH0DLremXkiRgE4VycaNhnDFnDVFQB85
	RlrIVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r90du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 14:43:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93df7a9466bso62348585a.2
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 07:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075431; x=1792680231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctsq3+iuFi3MtzssQO1t1IJwSkNjscSenYh4eM7gop4=;
        b=cj90ylFXuw6uOmm5Utj+MJ45w3eXbL5yYN62yugtVVrPNUqtcGCbYo1ZmR2bfCiD28
         1bJ+tVh7ai6Lx90wcIMQqPKtF15noxo9/tTUDlMl9gjyah812yitzTZabIpnb2o+bZ4N
         ywky1UNOfO0ek6uRDOtCpwGZxZtvkKZwPHCkTeK8d9iZCgbDWglVHW3iMOLxPL8fbE5R
         2fQ5ktyS83KdFyOGGkr1pspoYJ8F4vKJ99KK0eBc8YxtM2c8G4LpSpRqiUCBN1vKrRUn
         4r7M8fxM5EREzOnguL4HMUh9QcygHLa+82KtQjN48a76nRixzbyRxUrd/qTxSKE+fMfY
         z32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075431; x=1792680231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ctsq3+iuFi3MtzssQO1t1IJwSkNjscSenYh4eM7gop4=;
        b=esVItXKW5bzoVINxOIpLmoApwWl6idJWewzzI3sAaBKPQ6g3mAAiCjwk6UR80mXmqj
         Oeqo6qllE9fNb97TEVaJuMqmEhnBInb/UxHjKzLreQHxpyJv/rD4UsJxHlrP9arfBFvU
         JuaEZzp6K18eRaDqlGRKWRYD1GsbB/BMVihYmFcNgdCj4vNnRxt15PobKHEX/q/iPBTP
         /ardlQNRzHPzOzYXDcu8PUBBipqta1yqQApj241sU5OADByMSIXWmH1GyjzYgdsUAdP+
         B5H6gxIqpE7TRcJKQ//ANOlWPF5vfeoBiGTP0CO+r5sOXIxRGqv+1w5ueHXGMxfqOIWR
         2uxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwm4GfqcXi/4WKlwe21Qy9/0ZwB8kxd2D3QmdLfaA8h1SOy1K8sbQ1Q42g8NZsAkHitAXIMX7qt1Yg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFW/vxkSvQbSXwQtHVhV+BxLhMRTHcUu3tjTi/BI7q3AK6x6Bj
	CK8zqYrn1ut6iCBfdIpgFJ2D7W2qpbETsTmY0i/d5h+o51Jmym1CVp49zxO3cuDapFfUIeNcykE
	sB7lbSWScPim6fKEISuItvdn4Z4KU1XuWEecL+zuS771FS1mo2PzIiJV9m+YkrAU=
X-Gm-Gg: AYBFou1tbGNtf/WFs7JVtp7gK1R2KBimPJp+9UuiH9t8DIFrFx7K+yWhN9Ce63jIH+f
	d6IzWbgSzDEqApZvz6xvmhC0sYP540Q7z4jZPMXH8M23hNnXMQNERY8WhjBVMf0tiscPNqIiLC1
	7WGmOVJtsMvZ9cWXnXJiMuk0+44/ULyDjgr7E8iK0NTvEBHHmG/S2Q2EOhn2gMi8VFiNe58fbiJ
	/V2DmlD6+CsGvCEa7WjhCh3unN5mE/iJmiI44KDNSZ7xksiHMZjIpGh4OsIoBik4uoLNIHRcwf0
	h2jnwiUtuzluhFIgfY95Q7mjqK26AalglBUFvG40LmeUxDlri/LlaGuDkJJx7NyGuM6z7qbks5S
	StUARxeUkBLSnXkXg7TLetQ==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3654727185a.2.1792075430477;
        Thu, 15 Oct 2026 07:43:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3654721585a.2.1792075429968;
        Thu, 15 Oct 2026 07:43:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed95478efsm136191466b.27.2026.10.15.07.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:43:49 -0700 (PDT)
Message-ID: <d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:43:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfXyR/6n5QXbjPb
 IZvmjHFZDNc7jTJsERcg5GrR9vjQotEGb/9OgsuVFsQNhaCi3AO+VFukbFRqlScc+GNkpvDrROU
 3ZxNGtZx+bfvCSftcGefcU+0kYjBBoE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX3c6XHJdcub0f
 4fsAAaWeZqo/x58ypxczOG7iaPhz2FiOJ720g8X7dPIQ6pF81GuPKt4XLDP2Th01ttq5Y02RfSW
 Ysopre0P83Wfjxz0x1dhUx7Nlt3FsO/k5OCZTIIQv9gw7yWFnz3MkV0lkAa52XzQUM43XUcHtjl
 3Kd02UnzIUqKlVjJ2DxWEYr7Y10eK9xE+42stUApOlzCKUM73yGD2PysNK27I4RppSsMP3ChmLO
 QSiIfoaRNn26IEicfI0kSLlZZbfz8Kwpv4U6L75CmmKF5HwIRm0pz0Y6/nmQs4Nao2sZyaZMrEn
 xlN5kXG9CLXjDtYjsGvZ6VXaZwxiHTNplwYXQtX/P0SekJEymOucjtk5nqgOS/NzYxN34QiwNWQ
 glR0NXRhV+JTfq9/1OiTsJSzyRqxO2X/sD6zG/96ivpcQA1D2OBoDkXvmgOoKZ61LxSz7NFVtcs
 jSNqeAP+KHTzzjB3Jaw==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0e6a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=foisExlbF95jOuBURZEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _5Z3ZNJUlEKSdUyVIzg6qK9qNARcWgxj
X-Proofpoint-ORIG-GUID: _5Z3ZNJUlEKSdUyVIzg6qK9qNARcWgxj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

On 9/29/26 11:35 PM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.
> 
> Restructure the driver to support per-path role switches and remove the
> chip-level role switch. Additionally, as EUD need not modify the USB
> role upon enabling, remove the unnecessary role switch call from
> enable_eud().
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---


[...]

> +	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
> +	if (!sw) {
> +		of_node_put(controller_node);
> +		return dev_err_probe(chip->dev, -EPROBE_DEFER,
> +				     "Failed to get controller role switch for path %d\n",
> +				     path_num);
> +	}

This will always probe defer on a fixed-role controller, we should patch
dwc3 to always register a roleswitch

Konrad
