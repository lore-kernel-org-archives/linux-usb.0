Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787928;
	b=u7qs6Es2y+RwxxrJ9umvnzPoskbY3PJ1R6dD6MrxKIM9lUYIDRlOsOdYe3y5wnIZULPA
	 u6GLK+k8TLS8s0r/wydiw9tDsLgrjzBuxiRSIDsRqYj2XsJoVPsMeJ4a4TARYjnST8h9T
	 CjnBkxpcg6r2hv5kK9c/Qhs2IFP88CGjbVDm5PFrXrvJHVLoGcGOrRx+EQlh7e+bPOK5i
	 kN5jthIW77k/n93xk0JJPAysocAZdnmYMpi3E/9OQehd26HB+aZjJc+n5CdSriazmE0JH
	 WJjZKljSkYlHAc3L6/HsQEeVkLsc351GR539bxdnSqCr8iUloerdfRHJ6pn24lG62/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
	b=IspkXJ8+a+l2l/UFAhs5jAvKd86HYfM4c5dJ55kf0LqTktWLx7FGFvbwKO2ZkWxicI1o
	 1IG/Bi/Ui7kAdTkQLgSABQl0KY8Iord5slcPMAObJvyURk41rHcbDYxYzwpepFf6w/vVS
	 R/2Co5/kPhJkzKgFO1Hzp/QeQWfxrURTtbcQ9M+wZwyIiDgKYJhNzTZ35rlLikYUCLEtT
	 Rm+RwnPFbCFBftpZjwycE3yX/0mm9tDzWI6eN/SyDofYuRpsJQJEmNs854vWaKFeq/4Hw
	 0pX+h6PQLCKqoyEPKj50YjYCZH5kzRh5P7WxfTx5rZ/meupXZB6d0DVqcyZspBQF0jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOjcsKcu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FORsxwKQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33C9606A31E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F33C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOjcsKcu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FORsxwKQ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARDtq4H2672057
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=; b=TOjcsKcuDkQqhKEM
	pY+66B0jBD0y+w2WuxCnqNyxwYqmtuMoZrTl0cJPLd/mTTklLplbhyMHb4TC5Wtq
	Ji2Qk2dzyLEh2cMIRuDPdYHqZpE/N6fX61D4TPWfBAqekwTKIPscpXnW+mrJEX1g
	T67dFtRLf4IjNGcPXVhIvoHFM1MztDlxyVpCMHvcXvYw2hHwPLywFmqnznbL2nOM
	sz22SEUOUEnjiVdwNO2bgpnoMVFCLggMv5jNCcGehEEubP3PBl+8lUty7whgbc4y
	8od1uEnUK+wQdjbAqIyVdpYI0rzoM6UghTNlC4hv0RttWqdHeAoj6pqD+rHn22WG
	zHDzIQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhhwtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:58:47 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecf0967947so334127e0c.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787926; x=1796392726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
        b=FORsxwKQO9IHATmRZuwnt/wzNKkR76nev4Im041FDN08XKsqjU4h+VVpkDoGm21N+f
         /oeDWC7HpwU5XAoQlfBoTZucLYqP2da14CrW2L7LXHltK8zA6hgd3FYjFMBJlh7gJTB+
         iD8G6N06MrZc/leeTgaSqm4ZRHGiVGyc5hvVqtkhQ6fAsP6PylP1sFZdxlR6y/biVyvP
         6suhILDhV7T7nlzNeWh9Z9G2sijUqJBTrC7KBxzn3QJYNhf6maSKO2w+9AfKYUiOWpje
         Gc72E6kLMJgBTCsCygQSVhizKDh/Je5Hnx9bL55FUerD2pHWiPV3arEFgvFuAb+dBxTF
         OYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787926; x=1796392726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
        b=R0CrHyAAR9qS3ruNYD4ubanQVVXeFFNpgN7xozFWXLbh0mTiD36FalAQhGPYIsc0VT
         +CaLYz9PUx/JV9BzEnu0o+FLqJnQNvT57KM4vQ5tnIAXkC7yDyDUmg7AYWJt4GhCiFVZ
         ibZfDCbjRJe3TRWOTdVaS3+OcPtxX/KoEQ/TPmKKwAiKsAhnD6JTFFDqthqwliRUItCU
         xHreT+T9j2TXhJ48DEH/3hRGnueuW0KOCYlnjz6fs2+TILAd8HbcRA5m75+QhYmv0epc
         LTIGXuEQ3TqTG9eHf74/3sNMiXcmtwKn8KXMY5/lOsk6y3+dpMvKjRbQUZxduFZJqfJl
         6iiQ==
X-Forwarded-Encrypted: i=1; AL+hErHabitnDwZqK2hhzKpcMw7OhYq6O9GUulE8gupClqMWZ0+Hcf1uq0FG/FxrkpqLCtU9N4KxHPfB64c=@vger.kernel.org
X-Gm-Message-State: APuU4Z92nFZJhJTFf5IGTjn7Ac+UNAiCvrVu1EiCLint7sf/BUbnQM6A
	y/adFsW7zpae6d9d5P5ZsZD9jYzC9x/9VpwfwDWpaiwVyOLXYPjnlJNPhsaqNyjGrjGi5hxw18p
	l3hAMyf1I5nsxRzhUZYhn6NnKiW+Q58n72NREOZ1avfWrWE3P/WfztlimX3nwhTo=
X-Gm-Gg: AZFdTZdkVIpTMfuruJ745OeGk43iX6QpJ9V+TMccncTtKt4l9DYe6ze2weYQBYz4b5t
	d8P43dvwESj1hyYagZPVfwUdf2FjJ4eYzdXr/EAQT1LYqqQNaL51LTtBNzp11+T3E2MlLfd9lCV
	pNeytvwrhytTcrKnvIF5DERgnmWncawztNJZLa6hO7DGdt38m3fXYzpZmbsrLrUY1Yoty1+40G4
	DjBr8ELnxL0B2XsC85vAan0h99jjJc+H1JXRT0ik8qSb/OQOv30/tBS7iahDXJJZ69dvuXMLe1f
	yXRTb7whXk+brgsoTMzDpbltCbhZQOXeY3/IbXnslNgGUplIHEC8UFODHNuile03RcyV4nvKPfm
	2vezcK3xLPDmz52M17qxZkk1GMftVJoutDN9iqalgrEvVwWaW7lS9bNt1DK8S1+2lwCM9g9E=
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr16434836e0c.1.1795787926277;
        Fri, 27 Nov 2026 05:58:46 -0800 (PST)
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr16434775e0c.1.1795787925770;
        Fri, 27 Nov 2026 05:58:45 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm10578803a12.32.2026.11.27.05.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:58:45 -0800 (PST)
Message-ID: <87280d80-9047-405b-8dcc-11276d34d2dd@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:58:40 +0100
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
Subject: Re: [PATCH v3 14/14] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
 <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX45FWkrdwXsTv
 BPRZKmsYRTRHelxr9dn2Yks/az4yfBOW0wl0LUFyfGfqrl+1UKUv4GU33C82BoNoDo//FsTfSNB
 xP9w4EI7PymSJc3p4XoCrIaT5yBcbKo=
X-Proofpoint-ORIG-GUID: fUcrvcq5YYcOXIryT9FiTUTAbh9nRN28
X-Proofpoint-GUID: fUcrvcq5YYcOXIryT9FiTUTAbh9nRN28
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b098c97 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pIfNyjNAQl_vEFP8Sf4A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX47CYpB35VQVy
 kN6LTrPDT/YGS9z5NGnlK8NlGPXjvIfgNz9EOgo20oyGmSrTWK6kRyqU/c/5CRZZqFTQIAMVhH4
 0jji1mHh9wPdmbY7XRunjkZzTh0/xJQw6zmaou815Gl/5GbkbOy4gSNHSInYp0WLf2dd6TyNSJ6
 FG5V58BZcCYPVAyNzdgDsneDj+aBEdP4O/Wt6b5kx8/Ldoupikd1xUw4idMgeuHzTd3gh9O3+9V
 oMf5VS71shEOLkHZusD6Ji7OAiThRa1DzQSPBK2fQQL3gjLimKrTXyxZlprVN6e1iOTAxVrbtQ+
 IyIRBFXTxeHRngILe/6HPN4bzqX5ICCBbvrcnNKOyVRR1FiofwzKW8ptR+cjUkoXJVS4paYhn4L
 jtRYjgwX9Dl7vpobVBGJ8/Zq0LwiDkPuCrcxna7QG/EEGBpHe3Vfcgvm9IoiZBxofFgRr2KeNhL
 w2WE1xFcfNBKcKFCQJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055

On 11/25/26 4:43 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Samsung Galaxy XR headset, which is based on
> the Qualcomm Halliday SoC (SXR2250P).
> 
> Supported so far: the PMICs and their regulators, the power and volume
> down keys, USB in high-speed peripheral mode and UFS storage.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
