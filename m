Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04BA3F7AAB
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 17:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492832; cv=none; b=me6oaozm/gDvL3IkbPOF9vB5EKcQFdg+nNdbDuYUi4S+UCwnO20+WAkF5kzO0vsldl2lRYj1y1Pv5Bv2FcemWd3zmJ+lP+MxBSHgdsXUiEjDAMovxOJtbQDUW7iAoRslUdhRD45xyLEnYEwV3eSVU2y5u7n3iPZNnJO8Iy5fMdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492832; c=relaxed/simple;
	bh=dbvG9K249lCyefMM14BZFhgNNJ3r5ozhGD93sWzhaiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoL2gr5c0o9fIXZ/h10vPDcrQF27B0pV04tjryw2VrCm+3sUBkAAUlh/VgZVrGpFsdPUtDY483xGzEIiuNhKTMbepKNtd+RH7ru8j4uMXv+JBY3Uvl5qNGIJw1lWLFlYNi7wAEf2TAcNnY+PFQWiq4WxTRUNUcEaSwJi+G+1IQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifTziyLK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SVyCOEGJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifTziyLK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SVyCOEGJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAduZ2836562
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 17:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=; b=ifTziyLKh9qzhc1M
	h8KULEL9XrG6sJ2Rxlru+TfiJczyUGqhJ13qjf7svvEAifWQjljbmR47S2Hs37ba
	n/gsT3aNTx7fenoFUw7v8edZuhLjxq/u4FzY6RXGs3geaSXMOxDBbFAzIpgimX+J
	JLOlG0YiSh//NFveu/QvVtQOoYJ0E9JLDWgio2kMxVb6nTyQAlsaEbmHIiyXwzpj
	NA83F6w9ZAw53xoTmE67j5FTiUasg9hygKStaKkM+nbAbYJiE8NX+O74ah0Hm3sQ
	aRFUnezZsufP6L4iwstUQISsY+4g1tutYXa8eJeDeCS7WJKNjFjOFZBOQrjxbuJO
	bodP/Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qpb85x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 17:20:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78a1ec363beso150302137.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 10:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789492828; x=1790097628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=;
        b=SVyCOEGJIBDg2XTkofHZXr/BLJBbWVphhtZcmznloxlpAIaslQQotGI56V9N3YYIVq
         hncVdwhMOEqHKB6KOMAYw09KuAU7kD0RMEiI3G6GGrSrMgnJSnqWU/W6WxjjV65Bsz31
         iga5A7dTyIz5jTiYZGkY9l2nY9nAd8RLTJq0A0StUzeu1BjiHWi7wcOM6v8nASD5RhGY
         Zp50FkTh5fR1xOZtuYk7qmmP4OlTzC8AMwMgUhPv6zqoi7YULd65LX27O6ltvCUzSRvB
         TXm9QvlgwZVeciJ6Cahdt+Ysly2tGjlcqmRWUs+jUwoR9svwaY7dcNMowbIfiZoUFV9R
         oSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492828; x=1790097628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=;
        b=TcAjXNPo9CRfpQLBYq812+UZgi0Sqwx5lq5orXg8y4sSCuzrFzb8ptpgUo7dZJyNyt
         w8D9XM+8Of7f4JJpAMouTc7e4g32MG53yIhQo/B2eFCRvVM7DBaUomQ8YbimphASZi2q
         8I4NH2Kz5cXdjoMK9oHwynNNod7q5OVTPHYM9U0vPuoEfek9vtOC4zQPoE/J+Pdg+mso
         nu4rNUPtElsUUdB7QJJXn/EiYhlYa0ybJxTKTw/S1/6gS/jup9VwTJ3etRiSKlcyylif
         E7/z+X+QK7NJdZCEV4hbdfv0k2Nqe/8vCDc5alMKqeLcvG7IINUBm1gtVs4WdI6zRB1k
         BabQ==
X-Gm-Message-State: AFuF++l+0B/6zHds0C9uCwRybPjJH70rtJWXel8lUFn74s+oOky4zjzx
	xbJ2h75AtqAte6ZmAUkOHdoXFWV+RYWAJ0QQBN8F33U9bNUDGLitW8FCRBhmo/eviTIsoOGKxC9
	ywC6YjzsGzGB7Z246uG2pZGmf+Yi6sfmD75hknvwZEesUcVgFui+Dd5H2roMSC+M=
X-Gm-Gg: AYBFou2GJnHe+nOfpfsnf3MqP4kvRDO100n0BSK2kZZZZfhnC8CEGajJwp1N/F466ar
	A63LzCq3loRI7Nq8MGG53dz3dGsiwKUHeb9SokuGDa0gmtm+tofwRKlsIeRyXQSQR6f+ukW9hwK
	S15Jx7o5Xidfl3jor74u4bGlhjqw+r/UAd2/ehBrn38EFYHce1Y4Yt/UjF4z0BPwtp53fxlSbk3
	T1L4rXjgOrZgMq2DMJ1o+OQJWnVoTzuebWgCpUbOD/4g7ju5hc9yhziv5o3PYiE6JEe/RWk07Cy
	xloFkTH7x1aTp1r3titg0xiUTF78jX4/14iyg1zGhExR0tAE9ZxZ0ddJ3KI8oaE2FsshCUewvWZ
	8d9HjOZFadbiWzyTZp6/3PQ==
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr3506272e0c.3.1789492828427;
        Tue, 15 Sep 2026 10:20:28 -0700 (PDT)
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr3506244e0c.3.1789492827984;
        Tue, 15 Sep 2026 10:20:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d27ad36sm26023a12.21.2026.09.15.10.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:20:27 -0700 (PDT)
Message-ID: <e55093ff-0441-49f0-9d06-6c100c8107aa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:20:24 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/22] thunderbolt: Try reading host DROM from device
 tree first
To: Sven Peter <sven@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Joshua Peisach <jpeisach@ubuntu.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-7-1f80085f93fb@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-7-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI1MyBTYWx0ZWRfX4mzsGE5ZMivY
 D+Vh+/pIHmfl1vf+UQjx3WoatmV6R++fI+3ht44eSQsbCM3zTw7kWewNck4U8UGvQcQFlTsT6+/
 6MZCNuCpKvA8vUBm68NO58lQNEsce6o=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa97e5d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=fxJcL_dCAAAA:8 a=i--5ToJz1EgYGg6QIxYA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: ZQrdT3d4fV871jUrVC1r0XGfXHserCqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI1MyBTYWx0ZWRfXwARVbzguR5T6
 LImoLCsOXZK1vhTplf9H6tekUItc9RS44nhALjhX2Cv0u3rBClhnJOK8zxUFFl7xqLn+97CACnI
 Eiie59uwyYAIlSS8BVH4ugjfP0GRx9SAMKPWJAi40hDh7bYvEbG8ZSHvP3de6k010a9lOroX/Ue
 ZlWE1VcPTiMCxaZEbdpTC+OdDb1Zx2yFNxnFDn8HU94lzj9HuvN7S8WIJhd5L18Vf5T+Ze50Uad
 E1BZ5F1cUGNqQJBjQmy+shmboKqDe+ajyb5T4nNjCVNQToYzHf2/MZPSujC40BO+W6MlpZaB0rK
 1y2MST0snnJzFC3l8w7mb3NWT4jDZm8bZAou+LykcPuswvptnJS1x0kDCJ1cLzSEuIGvE8GnqRv
 ijrnTqgxy4z5ct4PGU+vEJgD7YWBO4zkbXFFqo2jXkRItky+rj8Ss/j84YZChYD8kWicakhCfsG
 3jK14wukOAnZlhNRaKQ==
X-Proofpoint-GUID: ZQrdT3d4fV871jUrVC1r0XGfXHserCqW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150253



On 9/6/26 8:36 PM, Sven Peter wrote:
> On Apple Silicon SoCs the DROM is provided by a device tree property.
> Try reading from that property first.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> ---

[...]

> +static int tb_drom_copy_of_apple(struct tb_switch *sw, u16 *size)
> +{
> +	return tb_drom_copy_property(sw, "apple,thunderbolt-drom", size);
> +}

I don't know how prevalent this property is in your ecosystem right now,
but generally I believe this would be more fitting as a vendor-neutral
property.

Konrad
