Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463396;
	b=Fw8DrpbS2aivg8QQCGgki67CS0Qr42/zICmmmyw6YFBkoiphdWi07AWwqilA9/MZUeQm
	 rw1xLD51IujPYXkby/aCW9XyxscCvXwq8oEJZWbMe2cFIB4/Aau/gQHiuz2bWHcn3N7+Z
	 5A2SqmkJyA5bx8twh86PvzKtwlnKI6PfnwXbjadNuBtf9aymFIn1kqvquNqxQrQgbt1IH
	 /TPfBeITKiYE4MqK8BD6QBLcB2IEFcuodoR9qJn3a88JcNEbcVSf2NS+DElSUYKW1Y5+Q
	 5wyTd90C6TAxBHsIY8wDqY8VMOd0BJ0Yn3vAuYpmtnzAwt2EA1JfArVFHQgEmRMbbmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463396;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CVJa0ec1ykJPShHAKneJEZU3KbXeSYGrLRw9bAOsE8E=;
	b=rhzGbh2d20xCmW1wWlDYLNzVoi7QZDSoTuT052yqpZYpOTWmFBxQpjPElLezY5mV8ALb
	 8Qw5a7QyIpw6GOhc9Hdiarr9p7OXQXNDmaMb6Lyf/H9FuPUOkEbA25429JvUU1ot/mhtj
	 TDP7J1uEMDNqWntxrbf2biNoFWyw7EW0maAcbcmEfyjSWEwv8vWRpX1HgEMdOjwJRK2v+
	 +olo8+sSEdOykNABioIMYqRN60aHN6+M2QiawTz12TlsrdXHx7RWLW3OrjwuUSxfUAKUh
	 9QmVCI+lxo4+3UEzaP9pjapx87CHUTIpiwP0sCHj7YYRJOGXi5FZsvpVTesno5QwvSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNFDQYDl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QFCerCUJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFDC606A686
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 19:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FFDC606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNFDQYDl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QFCerCUJ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH1jb2377356
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 19:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CVJa0ec1ykJPShHAKneJEZU3
	KbXeSYGrLRw9bAOsE8E=; b=oNFDQYDlUqLDGYSfWQjJgUc0WhKW8Jlb9ArxRPaB
	JWgxzwCvr56yY2Doe23s4TlGFoH208Gb8rALErW8OFPHulDOE3OqhdwqsyFpuZfY
	RsrOin4v5QtflLUBmxtjLCLj37mPfH9H1R9KXC/LPUljoBPOoCYYmP2bA5KAWZ2h
	r6dMkSUXHyehmwbWW+CTxb/oC7arNxGXGrxNO4SlBV1ZPXk1TaZfnlu00sfI0CjX
	H55FTe4ZsCkd/chPEE4/qULcu6G1Z4pQqwjpyM5Ob/iznvZBK6H/ElhcZbGlNlzh
	cf6IWlY2a++noDatMBjVbLsyB7m0gD1PyoxM4QQmweTBJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut5hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 19:49:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94970ad532bso72180785a.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 11:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463395; x=1796068195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CVJa0ec1ykJPShHAKneJEZU3KbXeSYGrLRw9bAOsE8E=;
        b=QFCerCUJsn/K8lSCVJmN/r7GGi+o976WtwkmAfwUwhXiIYmx+I6O1FZ4iOsfFknVeN
         7DDnPKwjGRx9rdtP9zfp+vawQhvPAG9XF9HUmzoDOWTKL53xhPLWo3QVzQLYTps1JhwD
         CZBIGYAmlQi2R+tT0kesuoeNv5ZwnNt7ktpSXU6EMxBg3YgowScoIs58J81lvFYn25dW
         jvV+J/YWkVjuXgrGbEeVUv/4TEdpvXOiZFNe8N1y3VQMWV13F9vUzPOn9m1va7T7p7f8
         gH42xhWZH0FAa0TprYTbrvnw3fuuEld8RMhZPRLkhNJZpHClj4MRi8zvqI2uIk8QPJyH
         jrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463395; x=1796068195;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVJa0ec1ykJPShHAKneJEZU3KbXeSYGrLRw9bAOsE8E=;
        b=tzmsSjFKCdFDDLNj5oWQKqr4h5Ge6rZfsB/+detTr4qGpXDjWg3XIBJVdtKm08LPFM
         /gV3AC6PZUVgsahmwoXNN/yXwh6NDwBciNqI/6OMGbkLBAuWibkw08Br1kEnvnIM1ep0
         0kH2DbubB09Z6RYVG5sfiX94tEgfBTByd8ncyWQmhZEFbwuDK0IJxyF8+u+GxN0G5N52
         fUTQ8CjK6AMIYpNuumabMSnbQM269uEJ9TD1CArs815/UjRde/7yEeDV5uynQ44LPVpZ
         YCw6rDhnnkQ1sl3QE+jYHlmm5JfX/Fw/1/uKXYLteTrT7vVm2KyszHyPLJSZKsxFd/BE
         ROQw==
X-Forwarded-Encrypted: i=1; AL+hErEpMVOC/tFZx5Em44mSwOHaKL1u/D0W8sDmO1IbIMT6LeyU/nxOBYy/Tr0YC2B6FWZ4cu2f6T6dTDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nuANZDEJQ6IzRFy/UxoF6IayziwvRNvRQ8NGpq1YaWVo2oKJQ
	yh7DNNFa1KN19jYvqUbOgsd6B0tRdR+z2W9m+jZdmQtnlzxJEvtWKUeIjpMqmkZXDvogeoqKcC9
	+JV9VKLEYJYOHe6RI5oj/FyeKWtHQUY9CyMhF5AOq9NyvxltOfnILnVwZ0xQ/Vzk=
X-Gm-Gg: AZFdTZdoDRDD5q1BlEICTGhcr56TcwIXnnMqZxPSzikFc5vTqKIT2Y5hxB4f29HtxRs
	ty5bn4MKBtcWwpOh1z+oRvnXDNrn5suCC7BaxeqxyySthFuuiMU3tvhgFrC7onDMLnvw3WDy+xn
	ZuRcJ/baJqerONCGYFqneA1JETmFdDQHOOTpuMPEucEWqDSO4JUn6GgkTHHRj3J6O0iD91BkbSY
	UiAIkO2VFmiG5cn37F4+ZM9BAIcqth7lEPnziEUH9Jn7kP2giqJhiU39k+nHUN2hEFc60MzpyYI
	+GnU/X94PSoBxwOpjkqTkLxMvrpQnjzkt/v+A5nQzn8hUmiopCZgihXDpKh9FXHlNp7NuEBLQol
	heFFecU0ZSb8wk3f8EcAp68xv0AcdAud1qA8tecEe9zhFF5OoXR0Q+wRAWCQCZqWZ
X-Received: by 2002:a05:620a:4485:b0:93e:c12c:9b6f with SMTP id af79cd13be357-949bab5bbddmr2003882985a.74.1795463394456;
        Mon, 23 Nov 2026 11:49:54 -0800 (PST)
X-Received: by 2002:a05:620a:4485:b0:93e:c12c:9b6f with SMTP id af79cd13be357-949bab5bbddmr2003877585a.74.1795463393771;
        Mon, 23 Nov 2026 11:49:53 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm376934425e9.3.2026.11.23.11.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:49:53 -0800 (PST)
Date: Mon, 23 Nov 2026 21:49:51 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qrb2210-arduino-imola: enable
 the EUD
Message-ID: <wq7xaiclvk6mxabafp5suuczp3n27sifs3lilfqpjx24esgike@q33z4veqdbtw>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-5-9bfc432dee07@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-qcm2290-eud-v2-5-9bfc432dee07@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CuFEdg6sdB0_EvBoEjSe7XIS67p3YB-q
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b0498e3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kF10rs2o5Heqwnj5SzoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: CuFEdg6sdB0_EvBoEjSe7XIS67p3YB-q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX8sWiD6SDsAMc
 ZZiuG4HgI4BeISTtA/HKYxyNZ8iRQm7QR2Ul6Mv8Irko+7D88801jI84nP4pf5qa+eoVsUDeKTL
 2L5UM4H3aDAbtk+hZmd+0x9u/pIOnuI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3VuF/IYlFxg5
 YBYOPb/RYXhCeV4wBot4f54zpzUibi6+O1b94Xayp6DsAb9YXjGN9iEq3OZlNMMNfyPEEt/CDmE
 0rGZNwus/vDessBzjAfCeO/3vgeyjdfXhWGzytaSpYObAfXOYtKHvyBAS5syfE+GeTPHrzpmgTR
 bU/pU55M5iyOxCKfKbH2qCHVF36Tfwil97PN71jPJ2StNJMMtq2KvfrmXbFmOk517f03+6cS4ex
 1G1dsvVRG2pQWsbZ60o+Th9GatSTXmGFkrZu4RScZBDKdxeUx44cRO9AvDFJgRqkJgK+EkJA3Y3
 9TUBVLph1hUAnjMVtyKPSoQRKnLTl5Ne/TmawlfSfpUpuKp9iIJaNIcymFyGd9sDM1+XAs1uNPZ
 CqKAFEjjv0fUE/6CeaQCeOSbZvsfCLVHEDq1dXxHj+E5qk852X5aqrSWHyxCWA5GBjW3CWG/HJY
 ausxjpnNT5HTP/5pElQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-23 17:43:00, Igor Opaniuk wrote:
> The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
> sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
> adapter uses to debug the SoC.
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
