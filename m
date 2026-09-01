Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7FC47ECFC
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 13:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268422; cv=none; b=TKcZD26mEMo6lhws0C0fgHHVrr1isGOFCuNiCZdRgnkYKh22TAJoz8H0JQhybxPfSPyR1igxcsr324nVOW2Szmj2iJT80ccDaF+0sVmHFpMtm58HvyhyndIODFSvoLpp1WDQ2W6SHwKONB8TJTd61mZA34TEB3H7tCNPrusmn5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268422; c=relaxed/simple;
	bh=YQAKN0YiI4XtvjUzINbwFPm07lgR9cOPHmT1QSjACjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2Fh+M23UOEMG1nlTTNGhDW4bcQXvCgaA24vq36U7qowQ27yJT45pMBN9/uZywh51NJnjnbSSp97w/oT/LpzPYkEgWoQvVZ71UWf/pBrh73W8sNKAD6vCkOGzo+uQmyTHl9EYDkzWVxHfOSewFgpz0L0Ob24WfRRPagaJzK3kgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHb9FEdt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NicmJDpp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHb9FEdt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NicmJDpp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJSME1137274
	for <linux-usb@vger.kernel.org>; Tue, 1 Sep 2026 13:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H3xHTMAfV/QCmIrjOhNyUOsdra0RGuUp/HHKVpaq+N0=; b=VHb9FEdttwlDQVrZ
	KgQWURvBgc/quc7TJyE+w3PbTByG1vYi7MHXpu9ZJbFakEDPqZ4ZLJ5C8tyuymiD
	R+7dKT8ekg+8+PoVKU4ggvVUbzuk/9RtZisOjUHjmR+l72TV/pukHRzOIuvbLNVD
	7yDFMG4YlzfERKbO20hUNq4/TE8DxxhwyYPS94G5MR64/53lnh645KAJSCarKly2
	OlrL5uiFHdktT9sXd7p6bVldos6htxzX2Dl9vmHBKWa1Cy3BVcHKCBO7aazcYBTW
	VOig1Ndd8wD5AbKUiPrK35o396tKkUGtp2+2yjZ3O8LVxUB1VBuAJXdVrd8mvoNL
	XuJV+w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsj08v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 13:13:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so143029e0c.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 06:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268418; x=1788873218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3xHTMAfV/QCmIrjOhNyUOsdra0RGuUp/HHKVpaq+N0=;
        b=NicmJDpp8gWi/LKwTeRR2lBATgB2TS5r3pSa8PZRUTJXF38AR/vaPw3cmypMr1SN70
         PhNwpQ8ibiEpMHlUpTatanBpfMZ+8CMKCB3UhtVy4m/xmmbCo+Z/othYxsnZKIHLMft4
         HznppXmx6Ec+v7syWbtTaKtNfOq86iiRI9PsxIAS/2v0ecDWtn0Razd5mvR1iRzwP1Rc
         Ry3BXg6JsDu5zR0N2UMfvlRzVMNoAX2qk0CI/NkJ34YZzURyCzDzN6ton3GVgfcg31pZ
         kIGffEhwImipUHkvhiD0VOz2OL+VKOO7kEWwcTYLUK7yLcS0SuCJ7+yW7m+i8SXnGPpb
         gZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268418; x=1788873218;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3xHTMAfV/QCmIrjOhNyUOsdra0RGuUp/HHKVpaq+N0=;
        b=alKkCWaU3QDdF4Cezp22efWixJwRMFdfERjHLnnH7sraCEoYS/y7ze4pH0j8lzpdvk
         MYVA/ujQTLiwz6qTp7IWvrZQERE6YHhAvTG1DOHahx/VQ+gQ5PfcZtKMI0rx8ZGYpGPD
         /Ql4+YnUNRG7xR2cmd2SknHVYb+5m4YTDWW4pU0QYw7SDgRSwynuXd34Gq48aaHEiwKX
         DvoPv3zhGbEWUaDPwk2iHZSJ0HHPW0gJVJJqk9GMlk/NTXwMEEVn+oaOinzmeEBAWWxu
         7xkHRHOSNuZt6ucs66VrjWn9lSzOroDKdvaYHk1rerjvxRWCJ75jCMNeMHbwZdgahX52
         LlPw==
X-Forwarded-Encrypted: i=1; AHgh+RoUKzhHD0ZMVMqICZeKKUcCZYJRLMEygYd3W19nhuMmPX+Aegla1Qa+9hj4LezcD91T0P1SPrXhJkA=@vger.kernel.org
X-Gm-Message-State: AFuF++km+7EVh8xGc/STTbVxVwREIuv6yu+1x9DqyQLW/jTt5H36hNGC
	lFczGM4RfhuDSUZM3RDgw3OHKvlkhTFTNcLZvxWh3oLzsTjjRGP5XM0RBzLypILXn0eXZSXfzU5
	CNSAtQ4oWF/+9zd2MCO/i+CAPBVWWelMjsW72uxR/dshDSfuVvHFPZ37vIYhEZe2BPhTRr7g=
X-Gm-Gg: AR+sD10JBBuum9PXTaUOpsR4gXiVVi6GVC0EuOuGeZnf/mdThEc61BZy/NBwmQudWVd
	p5q9oIu8T0UYD0qQaeIvkeKWgUj7c2o88Kjw1nYfiigYzMnfoPJ6DtekkrwVsLwQcSFETYwzK4C
	gdLlwnEv/OdB7/NsGiLpi66MFMPqcBucX/xL8TDJGhIm9gmVEk9d3NKAvxzXjQhUzLG+D8Wb3wn
	iL02tinW0JFTBtA03c3zT02gFbWqeEZqxtWx6LranYgJgjNGJxkmDwgeqpxpEG5GyGuRZjGoFNh
	YceZZK2GNdLsEJtOrgjnWbUXTQ3RZGlacvXT/j1Dlk8b+xfGRYOfu5/Je1yy1AHibD/OlOPalgc
	dGt1X8bCFK2Zjbg2Ck2atSQ==
X-Received: by 2002:a05:6122:6302:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c680fff6fbmr3837924e0c.1.1788268418606;
        Tue, 01 Sep 2026 06:13:38 -0700 (PDT)
X-Received: by 2002:a05:6122:6302:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c680fff6fbmr3837859e0c.1.1788268416683;
        Tue, 01 Sep 2026 06:13:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5e1esm2901431e87.2.2026.09.01.06.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:13:35 -0700 (PDT)
Message-ID: <a57699e0-a0b4-438a-9ea3-db913301d90f@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:13:32 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Refactor init regs table definitions
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-4-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-4-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX4YPyyDVjZZxw
 y7P0NH29GBqEq6swEC0AW/CFwh8BStfjJhW4Bg9afIagVDsCYpT472Ru/a/ROoNcCy+gvu2bnMk
 JvCMyy41lmfloYfn9Yv3mRd2X4We0pQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXxKHC0q3xsieU
 191qJqxtFH6WiY4S7jRQ7EWpIAtll46pU712IP+A3kfMx1BRLVXmUOFT7imOwt5j9ivhpWzFg9H
 kLW8NvjpfoflAkE8CTlxpzhXJXfJYGjDnqA74l//7Ifu+v0SPx9vRt1pW3VmQmh+IF36Xcjg5PS
 KeEAklldnIIO8f3UkUAlVd3fWsJz8ucj41Ib61XzM5qLlJmVFUaobbE6Y+D9pWI+C/NNMcbCpgi
 OgEkybBNRnGbDFBSSB4H2VswyH2ZLNuWEpKwSvNGPu5P7jXch+2mISB5sNpTqKDrmOeKgihZ/Sm
 zkXwI/Koz/M0py0WnKtna0HPyscITJ877UyzSvmvvVCW5gnl6WBVLxi8WyH3Vs81Vn1LkKvVMqD
 I7qOOLx4gEZamoTZ5/fodUSTx1bVc14NbSERIjuoWt+NGfUoZ15LwN0+0WgEj6JlTC7nz/DMVky
 pdm+cS7k4bBcNW0rvmg==
X-Proofpoint-GUID: Vi65B8xuFSBLwS6hzWjUxcbnjNfNeE1w
X-Proofpoint-ORIG-GUID: Vi65B8xuFSBLwS6hzWjUxcbnjNfNeE1w
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96cf83 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=XBovKe10WAMj5E-UAXEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Refactor the IPQ5018/IPQ5332 UNIPHY PCIe init data by introducing a
> helper macro for register/value entries and converting open-coded struct
> initializers to the compact form.
> 
> Also remove an unused include, drop unused macro register definitions,
> and rename the IPQ5332-specific PHY CFG register macros to make their
> combo PCIe/USB3 scope explicit.
> 
> No functional change intended.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
